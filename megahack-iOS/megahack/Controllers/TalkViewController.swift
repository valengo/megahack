//
//  TalkViewController.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

private let reuseIdentifiers = ["TalkDescriptionCell", "RealtimeCell"]

class TalkViewController: UIViewController {
    @IBOutlet weak var talkTable: UITableView!
    
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
        return reuseIdentifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = reuseIdentifiers[indexPath.row]
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}

extension TalkViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = reuseIdentifiers[indexPath.row]
                
        if identifier == "RealtimeCell" {
            IntegrationManager.shared.open(url: "https://www.menti.com/9ntzy4vqio", for: .menti)
        }
    }
}
