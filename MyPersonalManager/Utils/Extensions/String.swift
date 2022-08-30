//
//  String.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 10/8/22.
//

import Foundation

extension String {
    static var empty: String { "" }
    
    func toDate(formatt: DateParser) -> Date {
        formatt.toDate(value: self) ?? Date()
    }
}
