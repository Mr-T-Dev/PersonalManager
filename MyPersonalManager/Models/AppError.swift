//
//  AppError.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 10/8/22.
//

import Foundation

public enum AppError: Error {
    case genericError(message: String?)
    case unknownTransactionType(concept: String)
    case notImplementedTransactionType(concept: String)
    case noConcept(date: Date, value: Double)
    
    var message: String {
        switch self {
        case .genericError(let message):
            return message ?? Strings.genericError.translated
        case .unknownTransactionType(let concept):
            return "No transaction on concept: \(concept)"
        case .notImplementedTransactionType(let concept):
            return "Not implementated transaction on concept: \(concept)"
        case .noConcept(let date, let value):
            return "No concept on transaction \(date.toString(format: .dd_MM_yyyy)) \(value)€"
        }
    }
}
