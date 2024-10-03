//
//  quizViewController.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 10/3/24.
//

import UIKit

class quizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var resultsOutlet: UILabel!
    
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var bananaOutlet: UIButton!
    
    @IBOutlet weak var appleOutlet: UIButton!
    
    @IBOutlet weak var potatoOutlet: UIButton!
    
    @IBOutlet weak var cakeOutlet: UIButton!
    
    @IBOutlet weak var cupcakeOutlet: UIButton!
    
    
    
    
    
    var chosenPerson: Person!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bananaOutlet.layer.cornerRadius = 10
        appleOutlet.layer.cornerRadius = 10
        potatoOutlet.layer.cornerRadius = 10
        cakeOutlet.layer.cornerRadius = 10
        cupcakeOutlet.layer.cornerRadius = 10
        againButton.layer.cornerRadius = 10
        makeQuestion()
        // Do any additional setup after loading the view.
    }
    
    func makeQuestion(){
        chosenPerson = AppData.students[Int.random(in: 0...AppData.students.count-1)]
        questionLabel.text = "What is " + chosenPerson.name + "'s favorite food?"
    }
    
    @IBAction func againAction(_ sender: Any) {
        resultsOutlet.isHidden = true
        againButton.isHidden = true
        makeQuestion()
    }
    
    
    @IBAction func bananaAction(_ sender: Any) {
        check(yum: .bananas)
    }
    @IBAction func appleAction(_ sender: Any) {
        check(yum: .apples)
    }
    @IBAction func potatoAction(_ sender: Any) {
        check(yum: .potatoes)

    }
    
    @IBAction func cakeAction(_ sender: Any) {
        check(yum: .cake)

    }
    
    @IBAction func cupcakeAction(_ sender: Any) {
        check(yum: .cupcakes)

    }
    
    
    func check(yum: Food){
        if resultsOutlet.isHidden == true{
            resultsOutlet.isHidden = false
            
            var hi = ""
            switch chosenPerson.favFood{
            case .apples:
                hi = "Apples"
            case .cake:
                hi = "Cake"
            case .bananas:
                hi = "Bananas"
            case .cupcakes:
                hi = "Cupcakes"
            case .potatoes:
                hi = "Potatoes"
            }
            
            if yum==chosenPerson.favFood{
                resultsOutlet.text = "You got it! It was " + hi
            }else{
                resultsOutlet.text = "Wrong. The favorite food was " + hi
            }
            againButton.isHidden = false
        }
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
