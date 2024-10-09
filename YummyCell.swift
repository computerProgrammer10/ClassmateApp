//
//  YummyCell.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 10/8/24.
//

import Foundation
import UIKit
class YummyCell: UITableViewCell{
    
    @IBOutlet weak var favClassOutlet: UILabel!
    @IBOutlet weak var favFoodOutlet: UILabel!
    @IBOutlet weak var nicknameOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!
    func configure(sStudent: Person){
        nameOutlet.text = sStudent.name; nicknameOutlet.text = "Nickname: \(sStudent.nickName)"; favFoodOutlet.text = "Fav Food: \(sStudent.favFood.rawValue)"; favClassOutlet.text = "Fav Class: \(sStudent.favClass)"
    }
}
