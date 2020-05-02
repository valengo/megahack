//
//  EventOnBoardingViewController.swift
//  megahack
//
//  Created by Andressa Valengo on 01/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import UIKit


class OnBoardingViewModel {
    let repository: FieldRepository
    var fields: [Field]
    
    init(repository: FieldRepository = FieldRepository()) {
        self.repository = repository
        self.fields = repository.getAll()
    }
    
    func isAnyFieldSelected() -> Bool {
        return fields.contains {$0.isSelected == true}
    }
}

class EventOnBoardingViewController: UIViewController {
    
    @IBOutlet weak var fields: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    
    let viewModel =  OnBoardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fields.dataSource = self
        fields.delegate = self
        fields.reloadData()
    }
}

extension EventOnBoardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.fields.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FieldCell.identifier, for: indexPath) as! FieldCell
        
        cell.bind(item: viewModel.fields[indexPath.row])
        
        return cell
    }
}

extension EventOnBoardingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.fields[indexPath.row].toggleSelection()
        
        collectionView.reloadItems(at: [indexPath])
        
        var buttonColor = UIColor(named: "DisabledButton")
        if (viewModel.isAnyFieldSelected()) {
            buttonColor =  UIColor(named: "LightRed")
        }
        
        // TODO improve animation
        continueButton.backgroundColor = buttonColor
    }
}
