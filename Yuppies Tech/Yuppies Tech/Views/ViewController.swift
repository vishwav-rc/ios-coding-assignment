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
        static let sectionHeader = "header"
    }

    @IBOutlet weak var collectionView: UICollectionView?
    
    private var viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        collectionView?.contentInset = UIEdgeInsets(top: 0,
                                                    left: 10,
                                                    bottom: 30,
                                                    right :10)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: Constants.sectionHeader,
                for: indexPath) as? SectionHeaderView else {
            fatalError("Unexpected header")
        }
        headerView.titleLabel?.text = viewModel.sectionHeader(section: indexPath.section)
        return headerView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.noOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        viewModel.noOfItemsInSection
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentifier,
                for: indexPath) as? ItemViewCell else {
            fatalError("Unexpected cell")
        }
        cell.backgroundColor = UIColor.black.withAlphaComponent(0.10)
        cell.loadRandomImage(url: viewModel.getImageUrl(indexPath: indexPath,
                                                        size: cell.frame.size))
        return cell
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView?.collectionViewLayout.invalidateLayout()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 10
        if indexPath.row == viewModel.lastItemInSection {
            let width = screenWidth - 10
            return CGSize(width: width, height: width)
        } else {
            let width = (screenWidth/2) - 10
            return CGSize(width: width, height: width)
        }
    }
}
