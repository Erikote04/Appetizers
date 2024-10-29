//
//  Date.swift
//  Appetizers
//
//  Created by Erik Sebastian de Erice Jerez on 30/10/24.
//

import Foundation

extension Date {
    
    var minAge: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var maxAge: Date {
        Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    }
}
