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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
