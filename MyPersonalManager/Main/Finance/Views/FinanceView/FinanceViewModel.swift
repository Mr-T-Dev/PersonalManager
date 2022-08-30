//
//  FinanceViewModel.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 9/8/22.
//

import Foundation
import SwiftUI

class FinanceViewModel: ObservableObject {
    @Published var presentSabUploader: Bool = false
    @Published var presentRevUploader: Bool = false
    
    @Published var urlToUpload: FinanceURLUpload?
    
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
    
    func openSabadell() {
        self.presentSabUploader = true
    }
    
    func openRevelot() {
        self.presentRevUploader = true
    }
    
    func onSabadellFileUploaded(result: Result<URL, Error> ) {
        switch result {
        case .success(let url):
            self.urlToUpload = .init(url: url, bank: .sabadell)
        case .failure(let error):
            self.error = .genericError(message: error.localizedDescription)
        }
    }
    
    func onRevolutFileUploaded(result: Result<URL, Error> ) {
        switch result {
        case .success(let url):
            self.urlToUpload = .init(url: url, bank: .revolut)
        case .failure(let error):
            self.error = .genericError(message: error.localizedDescription)
        }
    }
}
