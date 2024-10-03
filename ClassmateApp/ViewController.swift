//
//  ViewController.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 9/30/24.
//

import UIKit

class AppData{
    static var students = [Person]()
}

class ViewController: UIViewController {

    @IBOutlet weak var quizButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var viewClassButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quizButton.layer.cornerRadius = 10
        addButton.layer.cornerRadius = 10
        viewClassButton.layer.cornerRadius = 10
        AppData.students.append(Person(favFood: .potatoes, name: "Pet-er Mickle", nickName: "Peter Kickle", favClass: "Computer Science"))
        AppData.students.append(Person(favFood: .bananas, name: "Ryan Stark", nickName: "Rat Ryan", favClass: "Explosions"))
        AppData.students.append(Person(favFood: .bananas, name: "Matthew Fitch", nickName: "Glitch Fitch", favClass: "View Controller Class"))
    }
    
    @IBAction func viewClassAction(_ sender: Any) {
        performSegue(withIdentifier: "toClassSegue", sender: self)
    }
    
    @IBAction func addClassAction(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: self)
    }
    
    @IBAction func foodAction(_ sender: Any) {
        performSegue(withIdentifier: "quizSegue", sender: self)
    }
    
}

