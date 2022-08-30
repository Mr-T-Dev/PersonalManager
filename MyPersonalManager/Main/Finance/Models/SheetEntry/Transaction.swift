//
//  Transaction.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 29/8/22.
//

import Foundation

enum TransactionType: String {
    case buy
    case transfer
    case debit
    case salary
    case service
}

protocol Transaction {
    var type: TransactionType { get }
}
