//
//  XLSXFile.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 10/8/22.
//

import Foundation
import CoreXLSX

extension XLSXFile {
    static func getFile(url: URL) throws -> XLSXFile {
        let data = try Data(contentsOf: url)
        return try XLSXFile(data: data)
    }
    
    func getRows() throws -> [CoreXLSX.Row] {
        do {
            for wbk in try self.parseWorkbooks() {
                for (_, path) in try self.parseWorksheetPathsAndNames(workbook: wbk) {
                    let worksheet = try self.parseWorksheet(at: path)
                    return worksheet.data?.rows ?? []
                }
            }
            
        } catch {
            throw AppError.genericError(message: error.localizedDescription)
        }
        
        return []
    }
}

extension CoreXLSX.Cell {
    var stringIndex: Int? {
        guard let value = self.value else { return nil }
        
        return Int(value)
    }
}

extension Array where Element == CoreXLSX.SharedStrings.Item {
    func getStringToCell(cell: CoreXLSX.Cell) -> String? {
        guard let index = cell.stringIndex else { return nil }
        
        return self[index].text
    }
}
