//
//  EventHomeTableView.swift
//  megahack
//
//  Created by Andressa Valengo on 02/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit

private let reuseIdentifiers = ["EventBannerCell", "EventDataCell", "FeaturingNowCard",
                                "NetworkFeatureCard", "SponsorsFeatureCard", "ScheduleFeatureCard"]


class EventHomeTableView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.contentInset = UIEdgeInsets(top: -UIApplication.shared.statusBarFrame.size.height, left: 0, bottom: 0, right: 0)

    }
    
    private func present(storyboardName: String, controllerName: String) {
        let targetStoryboard =  UIStoryboard(name: storyboardName, bundle: nil)
        let vc = targetStoryboard.instantiateViewController(withIdentifier: controllerName)
        
        if let vc = vc as? TalkViewController {
            vc.modalPresentationStyle = .fullScreen
        }
        
        present(vc, animated: true, completion: nil)
            
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reuseIdentifiers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = reuseIdentifiers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        let reuseIdentifier = reuseIdentifiers[indexPath.row]
        
        if (reuseIdentifier == "EventDataCell") {
            IntegrationManager.shared.open(url: "https://youtu.be/cQ8Kjgj3ck4")
        }
        else if (reuseIdentifier  == "FeaturingNowCard") {
            present(storyboardName: "EventHome", controllerName: "TalkViewController")
        } else if reuseIdentifier == "NetworkFeatureCard" {
            present(storyboardName: "Networking", controllerName: "NetworkingViewController")
        } else if reuseIdentifier == "SponsorsFeatureCard" {
            present(storyboardName: "Sponsors", controllerName: "SponsorViewController")
        } else if reuseIdentifier == "ScheduleFeatureCard" {
            let alert = AlertBuilder.shared.build(with: "Cronograma", and: "Aqui você poderá conferir todo o cronograma do evento!")
            present(alert, animated: true, completion: nil)
        }
    }

}
