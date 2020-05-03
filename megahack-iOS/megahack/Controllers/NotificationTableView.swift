//
//  NotificationTableView.swift
//  megahack
//
//  Created by Andressa Valengo on 02/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit


class NotificationViewModel {
    
    private let repository: NotificationRepository
    let data: [Any]
    
    init(notificationRepo: NotificationRepository = NotificationRepository()) {
        self.repository = notificationRepo
        self.data =  notificationRepo.getAll()
    }
}

class NotificationTableView: UITableViewController {

    let viewModel = NotificationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let header = viewModel.data[indexPath.row] as? String {
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationGroupCell.identifier, for: indexPath) as! NotificationGroupCell
            cell.groupLabel.text = header
            return cell
        } else {
            let notification = viewModel.data[indexPath.row] as! EventNotification
            let cell =  tableView.dequeueReusableCell(withIdentifier: NotificationCell.identifier, for: indexPath) as! NotificationCell
            cell.userImageView.image = UIImage(named: notification.imageName)
            cell.notificationLabel.text  = notification.description
            cell.notificationTime.text = notification.time
            return cell
        }
    }
}
