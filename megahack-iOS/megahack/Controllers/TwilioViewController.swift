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
    
    var room: Room?
    
    var localAudioTrack = LocalAudioTrack()
    var localDataTrack = LocalDataTrack()
    var localVideoTrack: LocalVideoTrack?
    
    var remoteView = VideoView()
    
    var camera: CameraSource?
    
    var urlSession = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents(string: "https://secure-island-89588.herokuapp.com/token")
        urlComponents?.queryItems = [URLQueryItem(name:"identity", value: UIDevice.current.name)] //Podemos mudar para o nome do usuário, se fizermos essa parte
        
        guard let url = urlComponents?.url else {
            return
        }
        urlSession.dataTask(with: url) { (data, _, error) in
            guard let data = data, let token = String(data: data, encoding: .utf8) else { return }
            self.accessToken = token
            print("Got access token")
            self.setUpVideo()
        }.resume()
    }
    
    func setUpVideo() {
        guard let frontCamera = CameraSource.captureDevice(position: .front) else { return }

        if let camera = CameraSource(delegate: self) {
            localVideoTrack = LocalVideoTrack(source: camera)

//            let renderer = VideoView(frame: self.view.bounds)
//            renderer.backgroundColor = .black
//
//            localVideoTrack?.addRenderer(renderer)
            self.camera = camera
//            self.view.addSubview(renderer)

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

        if let remoteView = VideoView.init(frame: self.view.bounds, delegate: self) {
            videoTrack.addRenderer(remoteView)
            self.view.addSubview(remoteView)
            self.remoteView = remoteView
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
