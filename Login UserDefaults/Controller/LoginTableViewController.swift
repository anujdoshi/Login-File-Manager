//
//  LoginTableViewController.swift
//  Login UserDefaults
//
//  Created by Anuj Doshi on 28/01/20.
//  Copyright © 2020 Anuj Doshi. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {
    var userArray = [User]()
    var filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("LoginDetails.plist")
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "user", for: indexPath)
        cell.textLabel?.text = userArray[indexPath.row].email
        return cell
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
}
