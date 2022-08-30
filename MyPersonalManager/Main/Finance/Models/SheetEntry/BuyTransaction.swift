//
//  SabadellTransaction.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 29/8/22.
//

import Foundation

struct BuyTransaction: Transaction {
    var type: TransactionType { .buy }
    
    let card: String
    let place: String
    let location: String
}
