//
//  TwilioViewController.swift
//  megahack
//
//  Created by Kevin Katzer on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit
import TwilioVideo

class TwilioViewController: UIViewController, RoomDelegate, LocalParticipantDelegate, CameraSourceDelegate, RemoteParticipantDelegate, VideoViewDelegate {

    var accessToken: String = ""
    public var roomName: String = ""
    
    var hasAccess: Bool = false {
        didSet {
            if (hasAccess) {
                self.setUpVideo()
            }
        }
    }
    
    var room: Room?
    
    var localAudioTrack = LocalAudioTrack()
    var localDataTrack = LocalDataTrack()
    var localVideoTrack: LocalVideoTrack?
    
    var localView = VideoView()
    
    var remoteView = VideoView()
    
    @IBOutlet weak var localViewContainer: UIView!
    
    var camera: CameraSource?
    
    var urlSession = URLSession.shared
    
    @IBOutlet weak var remoteViewsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remoteViewsCollection.delegate = self
        remoteViewsCollection.dataSource = self
        
        var urlComponents = URLComponents(string: "https://secure-island-89588.herokuapp.com/token")
        urlComponents?.queryItems = [URLQueryItem(name:"identity", value: UIDevice.current.name)] //Podemos mudar para o nome do usuário, se fizermos essa parte
        
        guard let url = urlComponents?.url else {
            return
        }
        urlSession.dataTask(with: url) { (data, _, error) in
            guard let data = data, let token = String(data: data, encoding: .utf8) else { return }
            DispatchQueue.main.async {
                self.accessToken = token
                print("Got access token")
                self.hasAccess = true
            }
        }.resume()
    }
    
    func setUpVideo() {
        guard let frontCamera = CameraSource.captureDevice(position: .front) else { return }

        if let camera = CameraSource(delegate: self) {
            localVideoTrack = LocalVideoTrack(source: camera)

            localView = VideoView(frame: self.localViewContainer.bounds)
            localView.backgroundColor = .black
            localView.contentMode = .scaleAspectFill

            localVideoTrack?.addRenderer(localView)
            self.camera = camera
            self.localViewContainer.addSubview(localView)

            camera.startCapture(device: frontCamera)
            self.createARoom()
        }
    }

    func createARoom() {
        let connectOptions = ConnectOptions(token: accessToken) { (builder) in
            builder.roomName = self.roomName

            if let audioTrack = self.localAudioTrack {
                builder.audioTracks = [audioTrack]
            }
            if let dataTrack = self.localDataTrack {
                builder.dataTracks = [dataTrack]
            }
            if let videoTrack = self.localVideoTrack {
                builder.videoTracks = [videoTrack]
            }
            print("Connecting to \(builder.roomName ?? "")")
        }
        room = TwilioVideoSDK.connect(options: connectOptions, delegate: self)
    }

    func roomDidConnect(room: Room) {
        print("Did connect to Room: " + room.name)

        if let localParticipant = room.localParticipant {
            print("Local identity \(localParticipant.identity)")

            // Set the delegate of the local particiant to receive callbacks
            localParticipant.delegate = self
        }

        print("Number of connected Participants \(room.remoteParticipants.count)")

        for remoteParticipant in room.remoteParticipants {
            remoteParticipant.delegate = self
        }
        DispatchQueue.main.async {
            self.remoteViewsCollection.reloadData()
        }
    }

    func participantDidConnect(room: Room, participant: RemoteParticipant) {
        print("Participant \(participant.identity) has joined Room \(room.name)")

        participant.delegate = self
    }

    func participantDidDisconnect(room: Room, participant: RemoteParticipant) {
        print("Participant \(participant.identity) has left Room \(room.name)")
    }

    func didSubscribeToVideoTrack(videoTrack: RemoteVideoTrack, publication: RemoteVideoTrackPublication, participant: RemoteParticipant) {
        print("Participant \(participant.identity) added a video track.")

        DispatchQueue.main.async {
            self.remoteViewsCollection.reloadData()
        }
    }
    
    func didUnsubscribeFromVideoTrack(videoTrack: RemoteVideoTrack, publication: RemoteVideoTrackPublication, participant: RemoteParticipant) {
        print("Participant \(participant.identity) removed a video track.")

        DispatchQueue.main.async {
            self.remoteViewsCollection.reloadData()
        }
    }

    func videoViewDimensionsDidChange(view: VideoView, dimensions: CMVideoDimensions) {
        self.view.setNeedsLayout()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TwilioViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let participants = room?.remoteParticipants.count else { return 0 }
        return participants > 2 ? participants + 1 : participants
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RemoteViewContainer", for: indexPath) as! RemoteViewCell
        let participants = (room?.remoteParticipants)!
        if (indexPath.row == participants.count) {
            self.localViewContainer.isHidden = true
            localView.frame = cell.container.bounds
            cell.container.addSubview(localView)
        } else {
            let participant = participants[indexPath.row]
            if participant.remoteVideoTracks.count > 0 {
                let videoPublications = participant.remoteVideoTracks
                for publication in videoPublications {
                    if let subscribedVideoTrack = publication.remoteTrack,
                        publication.isTrackSubscribed {
                        
                        if let remoteView = VideoView.init(frame: cell.container.bounds, delegate: self) {
                                subscribedVideoTrack.addRenderer(remoteView)
                                remoteView.contentMode = .scaleAspectFill
                                cell.container.addSubview(remoteView)
                                self.remoteView = remoteView
                            }
                        return cell
                    }
                }
            }
        }
        return cell
    }
    
    
}

extension TwilioViewController: UICollectionViewDelegate {
    
}

extension TwilioViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let participants = room?.remoteParticipants.count else { return CGSize(width: 0, height: 0) }
        let width = 414
        let height = 896
        if (participants < 3) {
            return CGSize(width: width, height: height/participants)
        }
        return CGSize(width: width/2, height: height/(participants/2))
    }
}
