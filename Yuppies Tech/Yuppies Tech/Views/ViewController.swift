//
//  ViewController.swift
//  Yuppies Tech
//
//  Created by Vishwanath Vallamkondi on 15/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    enum Constants {
        static let cellIdentifier = "identifier"
    }

    @IBOutlet weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentifier,
            for: indexPath)
        cell.backgroundColor = UIColor.green
        return cell
    }
}
