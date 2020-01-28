//
//  ViewController.swift
//  Login UserDefaults
//
//  Created by Anuj Doshi on 28/01/20.
//  Copyright © 2020 Anuj Doshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userArray = [User]()
    var filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("LoginDetails.plist")

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    
    @IBAction func loginbtn(_ sender: UIButton) {
        //loading()
        saveData()
        performSegue(withIdentifier: "showLogin", sender: self)
    }
    func loadData(){
        if let data = try? Data(contentsOf: filePath!){
            let decoder = PropertyListDecoder()
            do{
                userArray = try decoder.decode([User].self, from: data)
            }
            catch{
                print("Error")
            }
        }
    }
    func saveData(){
        let encoder = PropertyListEncoder()
        let newUser = User()
        newUser.email = emailTextField.text!
        newUser.password = passwordTextField.text!
        userArray.append(newUser)
        do{
            let data = try encoder.encode(self.userArray)
            try data.write(to: filePath!)
        }catch{
            print("Error")
        }
    }
    func loading(){
        let spinner = UIActivityIndicatorView(style: .large)
        view = UIView()
        //view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.backgroundColor = UIColor.white
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

