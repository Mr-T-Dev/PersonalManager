//
//  SabadellParser.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 10/8/22.
//

import Foundation
import CoreXLSX

struct SabadellParser: SheetParser {
    static func parse(rows: [CoreXLSX.Row], sharedStrings: [CoreXLSX.SharedStrings.Item]) -> [SheetEntry] {
        var entries: [SheetEntry] = []
        for row in rows where row.reference >= 2 {
            guard let operationDate = sharedStrings.getStringToCell(cell: row.cells[0]),
                  let concept = sharedStrings.getStringToCell(cell: row.cells[1]),
                  let amount = row.cells[3].value,
                  let balance = row.cells[4].value else {
                break
            }
            
            entries.append(.init(
                bank: .sabadell,
                operationDate: operationDate.toDate(formatt: .dd_MM_yyyy),
                concept: concept,
                amount: amount,
                balance: balance,
                ref1: sharedStrings.getStringToCell(cell: row.cells[5]),
                ref2: sharedStrings.getStringToCell(cell: row.cells[6])
            ))
        }
        
        return entries
    }
}
