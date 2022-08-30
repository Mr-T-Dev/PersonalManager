//
//  FinanceView.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 9/8/22.
//

import SwiftUI

// swiftlint:disable line_length
struct FinanceView: View {
    @ObservedObject var viewModel = FinanceViewModel()
    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .center) {
                HStack {
                    VStack {
                        Button(action: viewModel.openSabadell, label: { Text("Upload Sabadell File") })
                            .fileImporter(
                                isPresented: $viewModel.presentSabUploader,
                                allowedContentTypes: [.spreadsheet],
                                onCompletion: viewModel.onSabadellFileUploaded
                            )
                        Button(action: viewModel.openRevelot, label: { Text("Upload Revolut File") })
                            .fileImporter(
                                isPresented: $viewModel.presentRevUploader,
                                allowedContentTypes: [.spreadsheet],
                                onCompletion: viewModel.onRevolutFileUploaded
                            )
                    }
                }
            }
            if let error = viewModel.error {
                Text(error.message)
                    .fontWeight(.bold)
                    .foregroundColor(.red).padding(25)
            }
        
            if let urlToUpload = viewModel.urlToUpload {
                ParseResultView(urlToUpload: urlToUpload)
            }
        }
    }
}
