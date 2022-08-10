//
//  FinanceView.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 9/8/22.
//

import SwiftUI

struct FinanceView: View {
    @ObservedObject var viewModel = FinanceViewModel()
    var body: some View {
        VStack {
            Button(action: viewModel.loadFile, label: { Text("Upload File") })
        }.fileImporter(isPresented: true, allowedContentTypes: [.text], onCompletion: <#T##(Result<URL, Error>) -> Void##(Result<URL, Error>) -> Void##(_ result: Result<URL, Error>) -> Void#>)
    }
}
