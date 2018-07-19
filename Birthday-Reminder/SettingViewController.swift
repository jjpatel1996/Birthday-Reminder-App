//
//  SettingViewController.swift
//  Birthday-Reminder
//
//  Created by Jay Patel on 19/07/18.
//  Copyright © 2018 Jay Patel. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var tableView:UITableView!
    
    var settingList = [3,1,1,4]
    
    var thirdList = ["About","Terms & Conditions","Privacy Policy","Source Library"]
    
    let headerText = ["","Set theme","About"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Setting"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeView(sender:)))
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        setupViews()
        setupConstraint()
    }

    func setupViews(){
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
   
        tableView.register(SyncCell.self, forCellReuseIdentifier: "SyncCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RemindCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AuthCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LaguageCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ThemeCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AboutCell")
    }
    
    func setupConstraint(){
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    }
    
    @objc func closeView(sender:UIBarButtonItem){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerText[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return tableView.dequeueReusableCell(withIdentifier: "SyncCell", for: indexPath) as! SyncCell
            }else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AuthCell", for: indexPath)
                cell.textLabel?.text = "Login or Register"
                cell.textLabel?.textColor = UIColor.blue
                cell.textLabel?.textAlignment = .center
                return cell
            }else {
                //goto Language Page
                let cell = tableView.dequeueReusableCell(withIdentifier: "LaguageCell", for: indexPath)
                cell.textLabel?.text = "Language: English"
                cell.accessoryType = .disclosureIndicator
                return cell
            }
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeCell", for: indexPath)
            cell.textLabel?.text = "Theme"
            cell.textLabel?.textAlignment = .center
            return cell
        }else if indexPath.section == 2 {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "RemindCell")
            cell = UITableViewCell(style: .value1, reuseIdentifier: "RemindCell")
            cell!.textLabel?.text = "Remind me On"
            cell!.detailTextLabel?.text = "Same day 9 AM"
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath)
            cell.textLabel?.text = thirdList[indexPath.row]
            cell.textLabel?.textAlignment = .center
            return cell
        
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //gotoView
        tableView.deselectRow(at: indexPath, animated: true)
        //Do Touching
    }
    
}


class SyncCell: UITableViewCell {
    
    lazy var LeftLable:UILabel = {
        let leftLabel = UILabel()
        leftLabel.text = "Sync"
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        return leftLabel
    }()
    
    lazy var RightSwitch:UISwitch = {
        let rightSwitch = UISwitch()
        rightSwitch.addTarget(self, action: #selector(SwitchChanged(sender:)), for: .valueChanged)
        rightSwitch.translatesAutoresizingMaskIntoConstraints = false
        return rightSwitch
    }()
    
    //target
    
    @objc func SwitchChanged(sender:UISwitch){
        
        //Update Change
        storage.set(sender.isOn, forKey: "Sync")
        storage.synchronize()
        
    }
    
    var storage = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        RightSwitch.setOn(storage.bool(forKey: "Sync"), animated: false)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        RightSwitch.setOn(storage.bool(forKey: "Sync"), animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        RightSwitch.setOn(storage.bool(forKey: "Sync"), animated: false)
    }
    
    func setup(){
       
        self.addSubview(LeftLable)
       self.addSubview(RightSwitch)
        
       LeftLable.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
       LeftLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
       LeftLable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
       RightSwitch.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 12).isActive = true
       RightSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
       LeftLable.rightAnchor.constraint(equalTo: RightSwitch.leftAnchor, constant: 8).isActive = true
        
    }
    
}

