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
        sponsorTable.delegate = self
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

extension SponsorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let identifier = reuseIdentifiers[indexPath.row]
        
        if identifier == "SponsorVideoCell" {
            let alert = AlertBuilder.shared.build(with: "Vídeo promocional", and: "Aqui você poderá assistir ao vídeo da empresa patrocinadora!")
            present(alert, animated: true, completion: nil)
        } else if identifier == "SweepstakeCell" {
            let alert = AlertBuilder.shared.build(with: "Sorteio", and: "Aqui você poderá se cadastrar para participar do sorteio da empresa patrocinadora!")
            present(alert, animated: true, completion: nil)
        } else if identifier == "SponsorConnectCell" {
            let alert = AlertBuilder.shared.build(with: "Redes e mídias", and: "Aqui você poderá seguir e se comunicar com a empresa patrocinadora!")
            present(alert, animated: true, completion: nil)
        } else if identifier == "SponsorAvailableCell" {
            let alert = AlertBuilder.shared.build(with: "Contato direto", and: "Aqui você poderá se comunicar diretamente via Whatsapp!")
            present(alert, animated: true, completion: nil)
        }
    }
}
