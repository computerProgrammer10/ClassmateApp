//
//  Person.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 9/30/24.
//

import Foundation

enum Food{
    case apples, cake, bananas, cupcakes, potatoes
}

class Person{
    var favFood: Food
    var name: String
    var nickName: String
    var favClass: String
    init(favFood: Food, name: String, nickName: String, favClass: String) {
        self.favFood = favFood
        self.name = name
        self.nickName = nickName
        self.favClass = favClass
    }
    init() {
        self.favFood = .bananas
        self.name = "name"
        self.nickName = "nickName"
        self.favClass = "favClass"
    }
}
