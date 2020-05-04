//
//  NetworkingViewController.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class NetworkingViewModel {
    
    let roomRepository: RoomRepository
    let categoryRepository: NetworkingCategoryRepository
    
    init(repo: RoomRepository = RoomRepository(), catRepo: NetworkingCategoryRepository = NetworkingCategoryRepository()) {
        self.roomRepository = repo
        self.categoryRepository = catRepo
    }
    
    var dataCount: Int {
        get {
            return 1 + roomRepository.getAll().count + 1 + categoryRepository.getAll().count
        }
    }
    
    func isHeader(at row: Int) -> Bool {
        return row == 0
    }
    
    func isSubheader(at row: Int) -> Bool {
        return row == roomRepository.getAll().count + 1
    }
    
    func isRoom(at row: Int) -> Bool {
        return row > 0 && row < roomRepository.getAll().count + 1
    }
    
    func getRoom(for row: Int) -> EventRoom {
        return roomRepository.getAll()[row - 1]
    }
    
    func getCategory(for row: Int) -> NetworkingCategory {
        return categoryRepository.getAll()[row - roomRepository.getAll().count - 2]
    }
}


class NetworkingViewController: UIViewController {
    
    let viewModel = NetworkingViewModel()
    
    @IBOutlet weak var networkingTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkingTable.dataSource = self
        networkingTable.delegate = self

    }
}

extension NetworkingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isHeader(at: indexPath.row) {
            return tableView.dequeueReusableCell(withIdentifier: "RoomHeaderCell", for: indexPath)
        } else if viewModel.isRoom(at: indexPath.row) {
            let room = viewModel.getRoom(for: indexPath.row)
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.identifier, for: indexPath) as! RoomCell
            cell.descriptionLabel.text = room.description
            cell.picture.image = UIImage(named: room.imageName)
            return cell
        } else if viewModel.isSubheader(at: indexPath.row) {
            return tableView.dequeueReusableCell(withIdentifier: "RecomendationHeaderCell", for: indexPath)
        }
        else {
            let category = viewModel.getCategory(for: indexPath.row)
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
            cell.descriptionLabel.text = category.description
            cell.illustrationImageView.image = UIImage(named: category.imageName)
            return cell
        }
    }
    
}

extension NetworkingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if viewModel.isRoom(at: indexPath.row) {
            let targetStoryboard =  UIStoryboard(name: "Twilio", bundle: nil)
            let vc = targetStoryboard.instantiateViewController(withIdentifier: "TwilioVideo")
                    
            if let vc = vc as? TwilioViewController {
                vc.modalPresentationStyle = .fullScreen
                vc.roomName = "MegaHack" //Ver como pegar o nome da sala
                present(vc, animated: true, completion: nil)
            }
        } else if (!viewModel.isHeader(at: indexPath.row) && !viewModel.isSubheader(at: indexPath.row)) {
            let category = viewModel.getCategory(for: indexPath.row)
            let targetStoryboard =  UIStoryboard(name: "Networking", bundle: nil)
            let vc = targetStoryboard.instantiateViewController(withIdentifier: "SuggestionsViewController")
            if let vc = vc as? SuggestionsViewController {
                vc.field = category.description
                present(vc, animated: true, completion: nil)
            }
            
        }
    }
}
