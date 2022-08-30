//
//  TransactionParser.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 29/8/22.
//

import Foundation

enum SabadellTransaction: String {
    case COMPRA
    case TRANSFERENCIA
    case ADEUDO
    case TELEFONOS
    case TARJETA
    case NOMINA
    case ELECTRICIDAD
    case ANUL
    case AGUA
    case ABONO
    case APORTACION
    case PAGO
}

struct TransactionParser {
    static func parseSabadell(concept: String) throws -> Transaction {
        let splitedConcept = concept.components(separatedBy: " ")
        
        guard splitedConcept.count > 1 ,
            let type = SabadellTransaction(rawValue: splitedConcept[0]) else {
            throw AppError.unknownTransactionType(concept: concept)
        }
        
        switch type {
        case .COMPRA:
            return BuyTransaction(card: "asdas", place: "asa", location: "asdas")
        default:
            throw AppError.unknownTransactionType(concept: concept)
        }
    }
    
    static func parseRev(concept: String) throws -> Transaction  {
        return BuyTransaction(card: "asdas", place: "asa", location: "asdas")
    }
}
