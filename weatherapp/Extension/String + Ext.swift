//
//  String + Ext.swift
//  weatherapp
//
//  Created by Eashan on 4/3/24.
//

import Foundation

extension Double {
    func toStringWithFormat(_ format: String) -> String {
        return String(format: format, self)
    }
    
    func stringValue(_ numOfDecimal: Int = 0) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = numOfDecimal
        return formatter.string(from: self as NSNumber) ?? ""
    }
}

extension Int {
    func stringValue(_ numOfDecimal: Int = 0) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = numOfDecimal
        return formatter.string(from: self as NSNumber) ?? ""
    }
}
