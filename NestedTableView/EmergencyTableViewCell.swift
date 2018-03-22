//
//  EmergencyTableViewCell.swift
//  NestedTableView
//
//  Created by Appinventiv on 26/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class EmergencyTableViewCell: UITableViewCell {
    
    var list=["First Cell","Second Cell","Third Cell","Fourth Cell"]
    
    @IBOutlet weak var nestedTableView: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nestedTableView.delegate=self
        nestedTableView.dataSource=self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
extension EmergencyTableViewCell:UITableViewDataSource,UITableViewDelegate
{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SECTION \(section)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        list.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=tableView.dequeueReusableCell(withIdentifier: "NestedBasicDetailsCell") as! NestedBasicDetailsTableViewCell
            cell.textLabel!.text=list[indexPath.row]
            return cell
        
    }
    
    
}
