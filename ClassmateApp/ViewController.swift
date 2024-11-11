//
//  ViewController.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 9/30/24.
//

import UIKit

class AppData{
    static var students = [Person]()
    static var defaults = UserDefaults.standard
    static func saveData(){
        var encoder = JSONEncoder()
        if let encoded = try? encoder.encode(students){
            defaults.set(encoded, forKey: "Students")
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var quizButton: UIButton!
    
    @IBOutlet weak var nicknameQuizOutlet: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var viewClassButton: UIButton!
    
    @IBOutlet weak var tableViewLabelOutlet: UIButton!
    
    var defaults = UserDefaults.standard
    var decoder = JSONDecoder()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quizButton.layer.cornerRadius = 10
        addButton.layer.cornerRadius = 10
        viewClassButton.layer.cornerRadius = 10
        nicknameQuizOutlet.layer.cornerRadius = 10
        tableViewLabelOutlet.layer.cornerRadius = 10
        
        
        if let blahStudents = defaults.data(forKey: "Students"){
            if let decoded = try? decoder.decode([Person].self, from: blahStudents){
                AppData.students = decoded
            }else{
                // if this somehow fails, add a default student to students
                AppData.students.append(Person())
            }
        }else{
            AppData.students.append(Person(favFood: .potatoes, name: "Pet-er Mickle", nickName: "Peter Kickle", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Ryan Stark", nickName: "Rat Ryan", favClass: "Explosions"))
            AppData.students.append(Person(favFood: .bananas, name: "Matthew Fitch", nickName: "Glitch Fitch", favClass: "View Controller Class"))
            AppData.students.append(Person(favFood: .bananas, name: "Daniel", nickName: "Bananiel", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Cam", nickName: "Chef Cam", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Ava", nickName: "Abba Ava", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Michael", nickName: "Michael Michael Tricycle", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Eva", nickName: "No Pickles Noftz", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Evan", nickName: "Flutin Evan", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Logan", nickName: "Googball Googan", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "John", nickName: "Gymmy John", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Ryan Spencer", nickName: "Rainbow Ryan", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Sean", nickName: "Boat Gone Sean", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Justin", nickName: "Wicked Weber", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Jayden", nickName: "Sleeping Sawyer", favClass: "Computer Science"))
            AppData.students.append(Person(favFood: .bananas, name: "Brennan", nickName: "Breaking Brennan", favClass: "Computer Science"))
        }
    }
    
    
    @IBAction func tableViewAction(_ sender: Any) {
        performSegue(withIdentifier: "tableViewSegue", sender: self)
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

