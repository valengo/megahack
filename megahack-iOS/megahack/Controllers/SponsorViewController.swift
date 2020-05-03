//
//  SponsorViewController.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

private let reuseIdentifiers = ["SponsorLogoCell", "SponsorVideoCell",
                                "SponsorAboutCell", "SweepstakeCell",
                                "SponsorConnectCell", "SponsorAvailableCell"]

class SponsorViewController: UIViewController {

    @IBOutlet weak var sponsorTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sponsorTable.dataSource = self
    }

}

extension SponsorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reuseIdentifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = reuseIdentifiers[indexPath.row]
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    
}
