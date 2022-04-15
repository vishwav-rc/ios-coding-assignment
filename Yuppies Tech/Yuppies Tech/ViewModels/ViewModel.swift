//
//  ViewModel.swift
//  Yuppies Tech
//
//  Created by Vishwanath Vallamkondi on 15/04/22.
//

import Foundation
import UIKit

class ViewModel {
    var noOfSections: Int {
        10
    }
    
    var noOfItemsInSection: Int {
        3
    }
    
    var lastItemInSection: Int {
        2
    }
    
    func sectionHeader(section: Int) -> String {
        "Section \(section + 1)"
    }
    
    func getImageUrl(indexPath: IndexPath, size: CGSize) -> URL? {
        let id = "2\(indexPath.section)\(indexPath.row)"
        let url = "https://picsum.photos/\(id)/\(Int(size.width))"
        return URL(string: url)
    }
}
