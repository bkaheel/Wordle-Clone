//
//  GameView.swift
//  wordle-clone
//
//  Created by Benjamin Kaheel on 11/23/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        NavigationView {
            VStack(spacing: 3) {
                GuessView(guess: $dm.guesses[0])
                GuessView(guess: $dm.guesses[1])
                GuessView(guess: $dm.guesses[2])
                GuessView(guess: $dm.guesses[3])
                GuessView(guess: $dm.guesses[4])
                GuessView(guess: $dm.guesses[5])
            }
            .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                .padding()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Button {
                            
                        } label: {
                            Text("Wordle")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.primary)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "chart.bar")
                            }
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape.fill")
                            }
                        }
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    GameView()
}
