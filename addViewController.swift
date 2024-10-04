//
//  addViewController.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 10/3/24.
//

import UIKit

class addViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nicknameOutlet: UITextField!
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var favFoodOutlet: UITextField!
    @IBOutlet weak var favClassOutlet: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAction(_ sender: Any) {
        nameOutlet.resignFirstResponder(); nicknameOutlet.resignFirstResponder(); favFoodOutlet.resignFirstResponder(); favClassOutlet.resignFirstResponder();
        var chosenFood = ""
        
            if favFoodOutlet.text! == "Apples" || favFoodOutlet.text! == "Cake" || favFoodOutlet.text! == "Bananas" || favFoodOutlet.text! == "Cupcakes" || favFoodOutlet.text! == "Potatoes"{
                chosenFood = favFoodOutlet.text!
            }
        if (chosenFood=="" || nameOutlet.text! == "" || nicknameOutlet.text! == "" || favClassOutlet.text! == ""){
            createAlert(alertTitle: "Enter Something", alertDesc: "You must enter something, and enter it correctly in every box")
        }else{
            var student = Person()
            student.name = nameOutlet.text!
            student.nickName = nicknameOutlet.text!
            switch chosenFood{
            case "Apples":
                student.favFood = .apples
            case "Cake":
                student.favFood = .cake
            case "Bananas":
                student.favFood = .bananas
            case "Cupcakes":
                student.favFood = .cupcakes
            case "Potatoes":
                student.favFood = .potatoes
            default:
                print("this person is kind of lazy ngl (how does this even get printed?)")
                // do nothing if this ever gets printed because it would make sense to keep the same food
            }
            student.favClass = favClassOutlet.text!
            AppData.students.append(student)
            createAlert(alertTitle: "Student Added", alertDesc: "It's Done!")
            nameOutlet.text = ""
            nicknameOutlet.text = ""
            favFoodOutlet.text = ""
            favClassOutlet.text = ""
        }
    }
    @IBAction func gestureAction(_ sender: Any) {
        nameOutlet.resignFirstResponder(); nicknameOutlet.resignFirstResponder(); favFoodOutlet.resignFirstResponder(); favClassOutlet.resignFirstResponder();
        
    }
    
    func createAlert(alertTitle: String, alertDesc: String){
        let alert = UIAlertController(title: alertTitle, message: alertDesc, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
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
