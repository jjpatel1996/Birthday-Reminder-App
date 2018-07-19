//
//  ViewController.swift
//  Birthday-Reminder
//
//  Created by Jay Patel on 19/07/18.
//  Copyright © 2018 Jay Patel. All rights reserved.
//

import UIKit


class BirthdayListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupViews()
    }
    
    func setupViews(){
        self.title = "Bi"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: #selector(gotoSettingPage(sender:)))
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(SearchTapped(sender:))),UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(gotoProfile(sender:)))]
        
    }
    
    @objc func gotoSettingPage(sender:UIBarButtonItem){
        let settingVC = SettingViewController()
        self.navigationController?.present(UINavigationController(rootViewController: settingVC), animated: true, completion: nil)
        
    }

    @objc func SearchTapped(sender:UIBarButtonItem){
        
    }
    
    @objc func gotoProfile(sender:UIBarButtonItem){
        
    }
    
}

