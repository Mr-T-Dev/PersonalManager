//
//  ParseResultView.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 9/8/22.
//

import SwiftUI

// swiftlint:disable line_length
struct ParseResultView: View {
    let urlToUpload: FinanceURLUpload
    @ObservedObject var viewModel = ParseResultViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .center) {
                switch viewModel.state {
                case .none:
                    EmptyView()
                case .parsing(let bank):
                    Text("Parsing bank: \(bank.rawValue)")
                }
            }
            if let error = viewModel.error {
                Text(error.message)
                    .fontWeight(.bold)
                    .foregroundColor(.red).padding(25)
            }
        }.onAppear(perform: {
            switch urlToUpload.bank {
            case .sabadell:
                viewModel.onSabadellFileUploaded(url: urlToUpload.url)
            case.revolut:
                viewModel.onRevolutFileUploaded(url: urlToUpload.url)
            }
        }).background(Rectangle().foregroundColor(.white))
    }
}
