//
//  SuggestionsViewController.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

class SuggestionsViewModel {
    
    let userRepo: UserProfileRepository
    let profiles: [UserProfile]
    
    init(repo: UserProfileRepository = UserProfileRepository()) {
        self.userRepo = repo
        self.profiles = repo.getAll()
    }
}

class SuggestionsViewController: UIViewController {
    
    let viewModel = SuggestionsViewModel()
    
    var field: String?
    
    @IBOutlet weak var userTable: UITableView!
    @IBOutlet weak var fieldLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldLabel.text = field
        
        userTable.dataSource = self
        userTable.delegate = self

    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension SuggestionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profile = viewModel.profiles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        
        cell.bind(user: profile)
        cell.fieldLabel.text = field
        
        return cell
    }
    
    
}

extension SuggestionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.profiles[indexPath.row]
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
    }
}
