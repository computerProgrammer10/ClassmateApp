//
//  tableViewController.swift
//  ClassmateApp
//
//  Created by DANIEL HUSEBY on 10/8/24.
//

import UIKit

class tableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var chosenStudent = 0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! YummyCell
        cell.configure(sStudent: AppData.students[indexPath.row])
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenStudent = indexPath.row
        performSegue(withIdentifier: "toClassmateView", sender: self)
    }
    
//    this is the story of a man named snatley
//    snatley worked in a construction building where he built buildings.
//    one day all of snatley's co workers were gone. what could it mean?
//    snatley came to a set of two open wrecking balls, and he entered the one on his left.
//    snatley entered the meeting wrecking ball, yet there was not a single person here either.
//    snatley is either super schizophrenic, or missed a memo.
//    snatley decided to go upstairs to his bosses office.
//    as snatley entered, its a good thing he doesnt know that the code to the keypad behind his bosses desk is 1029381720938128759127839186519928371509687561234571891324354657687980
//    see it doesnt really matter if the narrator tells snatley or not because theres no way in hell snatley could memorize it.
    
//    well what the heck. alright snatley. you must be cheating.
//    surely snatley mustve taken a "screenshot" or read off this transcript from some sort of wiki
//    but snatley, you are cheating! this is cheating! snatley you cannot just be cheating like this!
//    and snatley knew that he cheated, and so he died. and that was a story of a man named snatley
    
//    okay hopefully you read that short excerpt from that other foolish narrator that thought the story would actually end, and he thought that i was dumb. what a silly.
    
//    if you havnt ill wait here. no seriously i will wait.
    
//    yeah no way im waiting for those silly fools that havnt read it yet. skill issue amirite?
    
//    anyway,
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if (AppData.students.count > 1){
                AppData.students.remove(at: indexPath.row)
                tableView.reloadData()
            }else{
                AppData.students.append(Person())
                AppData.students.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
    }
    func createAlert(alertTitle: String, alertDesc: String){
        let alert = UIAlertController(title: alertTitle, message: alertDesc, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBOutlet weak var addClassmateOutlet: UIButton!
    
    override func viewDidLoad() {
        addClassmateOutlet.layer.cornerRadius = 10
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addAction(_ sender: Any) {
        performSegue(withIdentifier: "toAddSegue", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewOutlet.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toClassmateView"{
            let nvc = segue.destination as! classViewController
            // send the name variable over to the redViewController
            nvc.curStudent = chosenStudent
            nvc.showButtons = false
        }
    }

    /*
    // HARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
