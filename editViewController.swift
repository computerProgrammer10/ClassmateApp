//
//  editViewController.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 10/2/24.
//

import UIKit

class editViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var nicknameOutlet: UITextField!
    
    @IBOutlet weak var favFoodOutlet: UITextField!
    @IBOutlet weak var favClassOutlet: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet var gestureOutlet: UITapGestureRecognizer!
    
    
    var student: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOutlet.delegate = self; nicknameOutlet.delegate = self; favFoodOutlet.delegate = self; favClassOutlet.delegate = self;
        submitButton.layer.cornerRadius = 10
        nameOutlet.text = student.name
        nicknameOutlet.text = student.nickName
        switch student.favFood{
        case .apples:
            favFoodOutlet.text = "Apples"
        case .cake:
            favFoodOutlet.text = "Cake"
        case .bananas:
            favFoodOutlet.text = "Bananas"
        case .cupcakes:
            favFoodOutlet.text = "Cupcakes"
        case .potatoes:
            favFoodOutlet.text = "Potatoes"
        }
        favClassOutlet.text = student.favClass

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gestureOutlet(_ sender: Any) {
        nameOutlet.resignFirstResponder(); nicknameOutlet.resignFirstResponder(); favFoodOutlet.resignFirstResponder(); favClassOutlet.resignFirstResponder();
    }
    
    @IBAction func submitAction(_ sender: Any) {
        nameOutlet.resignFirstResponder(); nicknameOutlet.resignFirstResponder(); favFoodOutlet.resignFirstResponder(); favClassOutlet.resignFirstResponder();
        
        if favFoodOutlet.text == "this is my favorite password"
        {
            performSegue(withIdentifier: "woahSecret", sender: nil)
            return
        }
        var chosenFood = ""
        
            if favFoodOutlet.text! == "Apples" || favFoodOutlet.text! == "Cake" || favFoodOutlet.text! == "Bananas" || favFoodOutlet.text! == "Cupcakes" || favFoodOutlet.text! == "Potatoes"{
                chosenFood = favFoodOutlet.text!
            }
        if (chosenFood=="" || nameOutlet.text! == "" || nicknameOutlet.text! == "" || favClassOutlet.text! == ""){
            createAlert(alertTitle: "Enter Something", alertDesc: "You must enter something, and enter it correctly in every box")
        }else{
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
            createAlert(alertTitle: "Student Edited", alertDesc: "It's Done!")
        }
                
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
