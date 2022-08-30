//
//  SheetParser.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 10/8/22.
//

import Foundation
import CoreXLSX

protocol SheetParser {
    static func parse(rows: [CoreXLSX.Row], sharedStrings: [CoreXLSX.SharedStrings.Item]) -> [SheetEntry]
}
