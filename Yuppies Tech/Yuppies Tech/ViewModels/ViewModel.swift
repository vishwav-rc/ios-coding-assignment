//
//  ViewModel.swift
//  Yuppies Tech
//
//  Created by Vishwanath Vallamkondi on 15/04/22.
//

import Foundation

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
}
