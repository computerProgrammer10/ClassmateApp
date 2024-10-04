//
//  nicknameViewController.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 10/4/24.
//

// unfinished
import UIKit

class nicknameViewController: UIViewController {

    @IBOutlet weak var questionOutlet: UILabel!
    
    @IBOutlet weak var nameOutlet: UITextField!
    var chosenStudent: Person!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    func makeQuestion(){
        nameOutlet.text = ""
        questionOutlet.text = "What is " + chosenStudent.name + "'s real name?'"
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
