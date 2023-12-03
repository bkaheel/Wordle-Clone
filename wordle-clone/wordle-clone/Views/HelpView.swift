//
//  HelpView.swift
//  wordle-clone
//
//  Created by Benjamin Kaheel on 12/3/23.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("How To Play")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Text("Guess the WORDLE in 6 tries.")
                    .font(.title3)
                Text(
"""

• Each guess must be a valid 5-letter word.
• The color of the tiles will change to show how
   close your guess was to the word.

"""
                )

                Text("**Examples**")
                Image("Weary")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Text("**W** is in the word and in the correct spot.")
                Image("Pills")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Text("**I** is in the word but in the wrong spot.")
                Image("Vague")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Text("**U** is not in the word in any spot.")
            
                Text("""
                     
                     A new puzzle is released daily at midnight. If
                     you haven't already, you can sign up for our
                     daily reminder email.
                     """)
                Spacer()

            }
//            .navigationTitle("HOW TO PLAY")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("**X**")
                    }
                }
            }
        }
    }
}

#Preview {
    HelpView()
}
