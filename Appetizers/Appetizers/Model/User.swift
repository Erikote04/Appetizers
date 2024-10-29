//
//  User.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 29/10/24.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthDate: Date = Date()
    var hasExtraNapkins: Bool = false
    var hasFrequentRefill: Bool = false
}
