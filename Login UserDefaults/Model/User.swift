//
//  User.swift
//  Login UserDefaults
//
//  Created by Anuj Doshi on 28/01/20.
//  Copyright © 2020 Anuj Doshi. All rights reserved.
//

import Foundation

class User:Encodable,Decodable{
    var email:String = ""
    var password:String = ""
}
