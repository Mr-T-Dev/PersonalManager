//
//  MovementEntry.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 10/8/22.
//

import Foundation
import RealmSwift

class MovementEntry: Object {
    @Persisted var card: String
    @Persisted var entity: String
    @Persisted var location: String?
    @Persisted var transactionDate: Date
    @Persisted var transactionAmount: Double
    @Persisted var balance: Double
    @Persisted var bank: String
    @Persisted var ref1: String?
    @Persisted var ref2: String?
    
    init(data: SheetEntry, bank: Bank) {
        self.bank = bank.rawValue
    }
}
