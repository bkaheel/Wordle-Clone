//
//  ToastView.swift
//  wordle-clone
//
//  Created by Benjamin Kaheel on 11/23/23.
//

import SwiftUI

struct ToastView: View {
    let toastText: String
    var body: some View {
        Text(toastText)
            .foregroundColor(.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}

#Preview {
    ToastView(toastText: "Not in word list.")
}
