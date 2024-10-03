//
//  classViewController.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 10/2/24.
//

import UIKit

class classViewController: UIViewController {

    @IBOutlet weak var nameOutlet: UILabel!
    
    @IBOutlet weak var classOutlet: UILabel!
    @IBOutlet weak var foodOutlet: UILabel!
    @IBOutlet weak var nickNameOutlet: UILabel!
    
    @IBOutlet weak var alphabeticalLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var alphaButton: UIButton!
    
    @IBOutlet weak var editButton: UIButton!
    var curStudent = 0
    var alphabetical = false
    var arrayToUse = AppData.students
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = 10
        alphaButton.layer.cornerRadius = 10
        editButton.layer.cornerRadius = 10
        updateInfo()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (!alphabetical){
            alphabeticalLabel.text = "(List Not Sorted Alphabetically)"
            arrayToUse = AppData.students
            updateInfo()
        }else{
            alphabeticalLabel.text = "(List Sorted Alphabetically)"
            arrayToUse = AppData.students
            arrayToUse.sort(by: sortFunciton(blah:blah2:))
            updateInfo()
        }
    }
    
    func updateInfo(){
        var student = arrayToUse[curStudent]
        nameOutlet.text = student.name
        foodOutlet.text = "Favorite Food: "
        switch student.favFood{
        case .apples:
            foodOutlet.text! += "Apples"
        case .cake:
            foodOutlet.text! += "Cake"
        case .bananas:
            foodOutlet.text! += "Bananas"
        case .cupcakes:
            foodOutlet.text! += "Cupcakes"
        case .potatoes:
            foodOutlet.text! += "Potatoes"
        }
        nickNameOutlet.text = "Nickname: " + student.nickName
        classOutlet.text = "Favorite Class: " + student.favClass
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if curStudent == arrayToUse.count-1{
            curStudent = 0
        }else{
            curStudent += 1
        }
        updateInfo()
    }
    @IBAction func backAction(_ sender: Any) {
        if curStudent == 0{
            curStudent = arrayToUse.count - 1
        }else{
            curStudent -= 1
        }
        updateInfo()
    }
    
    @IBAction func alphabeticallyAction(_ sender: Any) {
        if (alphabetical){
            alphabetical = false
            alphabeticalLabel.text = "(List Not Sorted Alphabetically)"
            curStudent = 0
            arrayToUse = AppData.students
            updateInfo()
        }else{
            alphabetical = true
            alphabeticalLabel.text = "(List Sorted Alphabetically)"
            curStudent = 0
            arrayToUse = AppData.students
            arrayToUse.sort(by: sortFunciton(blah:blah2:))
            updateInfo()
        }
    }
    
    func sortFunciton(blah: Person, blah2: Person) -> Bool{
        blah.name < blah2.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditScreen"{
            let nvc = segue.destination as! editViewController
            // send the name variable over to the redViewController
            nvc.student = arrayToUse[curStudent]
        }
    }
    @IBAction func editAction(_ sender: Any) {
        performSegue(withIdentifier: "toEditScreen", sender: self)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
