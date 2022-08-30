//
//  Date.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 10/8/22.
//

import Foundation


extension Date {
    func toString(format: DateParser) -> String {
        format.toString(date: self)
    }
}
