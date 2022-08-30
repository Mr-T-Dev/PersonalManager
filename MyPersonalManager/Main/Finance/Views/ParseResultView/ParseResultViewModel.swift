//
//  ParseResultViewModel.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 29/8/22.
//
import Foundation
import SwiftUI
import CoreXLSX

class ParseResultViewModel: ObservableObject {
    @Published var state: ParseState = .none
    
    // TODO: Create custom error
    @Published var error: AppError? { didSet {
        if error != nil {
            DispatchQueue.main.asyncAfter(
                deadline: .now() + 3,
                execute: {
                    self.error = nil
                }
            )
        }
    }}
    // TODO: Create custom success
    @Published var success: String? = nil
    
    func onSabadellFileUploaded(url: URL) {
        state = .parsing(.sabadell)
        
        do {
            let file = try XLSXFile.getFile(url: url)
            let sharedStrings = try file.parseSharedStrings()?.items ?? []
            let data = SabadellParser.parse(rows: try file.getRows(), sharedStrings: sharedStrings)
            
//            self.parseResult = data.map { entry -> Result<(SheetEntry, Transaction), AppError> in
//                do {
//                    let transaction = try entry.buildTransaction()
//
//                    return.success((entry, transaction))
//                } catch {
//                    if let castedError = error as? AppError {
//                        return .failure(castedError)
//                    }
//
//                    return .failure(.genericError(message: error.localizedDescription))
//                }
//            }
            
            
        } catch {
            self.error = .genericError(message: error.localizedDescription)
        }
    }
    
    func onRevolutFileUploaded(url: URL) {
        state = .parsing(.revolut)
        do {
            let file = try XLSXFile.getFile(url: url)
            let sharedStrings = try file.parseSharedStrings()?.items ?? []
//            let data = SabadellParser.parse(
//                rows: try file.getRows(),
//                sharedStrings: sharedStrings
//            )
//            self.sabadellData = data
        } catch {
            self.error = .genericError(message: error.localizedDescription)
        }
    }
}

extension ParseResultViewModel {
    enum ParseState {
        case none
        case parsing(Bank)
    }
}
