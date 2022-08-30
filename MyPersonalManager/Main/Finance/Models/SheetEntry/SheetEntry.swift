//
//  SheetEntry.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 29/8/22.
//

import Foundation

enum Bank: String {
    case revolut
    case sabadell
}

struct SheetEntry: Hashable {
    let bank: Bank
    let operationDate: Date?
    let concept: String
    let amount: String
    let balance: String
    let ref1: String?
    let ref2: String?
    
    func buildTransaction() throws -> Transaction {
        switch bank {
        case .revolut:
            return try TransactionParser.parseRev(concept: self.concept)
        case .sabadell:
            return try TransactionParser.parseSabadell(concept: self.concept)
        }
    }
}
