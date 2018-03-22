//
//  ViewController.swift
//  NestedTableView
//
//  Created by Appinventiv on 26/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var list=["First Cell","Second Cell","Third Cell","Fourth Cell"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate=self
        tableView.dataSource=self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 1
    //    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SECTION \(section)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        list.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row==3) ? 300 : 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row ==  0{
            let cell=tableView.dequeueReusableCell(withIdentifier: "BasicDetailsCell") as! BasicDetailsTableViewCell
            //cell.textLabel!.text=list[indexPath.row]
            return cell
        }
            
        else if indexPath.row == 1{
            let cell=tableView.dequeueReusableCell(withIdentifier: "DateOfBirthCell") as! DateOfBirthTableViewCell
            //cell.textLabel!.text=list[indexPath.row]
            return cell
            
        }
            
            
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell") as! CourseTableViewCell
          //  cell.textLabel!.text=list[indexPath.row]
            return cell
        }
            
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmergencyCell") as! EmergencyTableViewCell
            //cell.textLabel!.text=list[indexPath.row]
            return cell
        }
    }
}
