//
//  User.swift
//  MenuApp
//
//  Created by Alex on 2024-10-16.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}

