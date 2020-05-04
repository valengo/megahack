//
//  TalkViewController.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

private let reuseIdentifiers = ["TalkDescriptionCell", "RealtimeCell", "TalkersCell"]


class TalkViewModel {
    
    let userRepo: UserProfileRepository
    let headers: [String]
    
    init(repo: UserProfileRepository = UserProfileRepository(), headers: [String] = reuseIdentifiers) {
        self.userRepo = repo
        self.headers = reuseIdentifiers
    }
    
    func isUser(at row: Int) -> Bool {
        return row > headers.count - 1
    }
    
    func getUser(at row: Int) -> UserProfile {
        return userRepo.getAll()[row - headers.count]
    }
    
    var dataCount: Int {
        get {
            return userRepo.getAll().count + headers.count
        }
    }
}

class TalkViewController: UIViewController {
    @IBOutlet weak var talkTable: UITableView!
    
    let viewModel = TalkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        talkTable.dataSource = self
        talkTable.delegate  = self
    }
    
    @IBAction func dismmiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension TalkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isUser(at: indexPath.row) {
            
            let user = viewModel.getUser(at: indexPath.row)
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
            cell.bind(user: user)
            return cell
            
        } else {
            let identifier = reuseIdentifiers[indexPath.row]
            return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
}

extension TalkViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if viewModel.isUser(at: indexPath.row) {
            let user = viewModel.getUser(at: indexPath.row)
            if user.social.type == .Whatsapp {
                let action = UIAlertAction(title: "Continuar", style: .default,
                                           handler: { (action) -> Void in
                    IntegrationManager.shared.open(url: user.social.url, for: user.social.type)
                })
                let alert = AlertBuilder.shared.buildCancelable(with: "Whatsapp sandbox", and: "Esse contato utiliza uma versão de testes do Whatapp da API da Twilio. Deseja continuar?", okAction: action)
                
                present(alert, animated: true, completion: nil)
                
            } else {
                IntegrationManager.shared.open(url: user.social.url, for: user.social.type)
            }
        } else  {
            let identifier = reuseIdentifiers[indexPath.row]
                    
            if identifier == "RealtimeCell" {
                IntegrationManager.shared.open(url: "https://www.menti.com/9ntzy4vqio", for: .menti)
            }
        }
    }
}
