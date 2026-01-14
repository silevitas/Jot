//
//  JotView.swift
//  Jot
//
//  Created for SwiftUI and Swift 6
//

import SwiftUI

struct JotView: View {
    @State private var viewModel = JotViewModel()
    
    var body: some View {
        TextEditor(text: $viewModel.textContent)
            .font(.system(size: 14, design: .default))
            .padding(10)
            .frame(width: 300, height: 400)
            .scrollContentBackground(.hidden)
            .background(Color(nsColor: .textBackgroundColor))
    }
}

#Preview {
    JotView()
}
