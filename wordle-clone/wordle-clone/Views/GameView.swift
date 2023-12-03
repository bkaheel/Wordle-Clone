//
//  GameView.swift
//  wordle-clone
//
//  Created by Benjamin Kaheel on 11/23/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    @State private var showStats = false
    @State private var showHelp = false
    @State private var isPresentingStats = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Spacer()
                    VStack(spacing: 3) {
                        ForEach(0...5, id: \.self) { index in
                            GuessView(guess: $dm.guesses[index])
                                .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                        }
                    }
                    .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                    Spacer()
                    Keyboard()
                        .scaleEffect(Global.keyboardScale)
                        .padding(.top)
                    Spacer()
                }
                .padding()
                .overlay(alignment: .top) {
                    if let toastText = dm.toastText {
                        ToastView(toastText: toastText)
                            .frame(width: 175, height: 15)
                            .fontWeight(.heavy)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack {
                            if !dm.inPlay {
                                Button {
                                    dm.newGame()
                                } label: {
                                    Image(systemName: "play")
//                                    Text("New")
                                        .foregroundColor(.primary)
                                        .font(.title3)
                                        .fontWeight(.bold)

                                }
                            }
                            
                            
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            
                        } label: {
                            Text("Wordle")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.primary)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: -0.5) {
                            Button {
                                showHelp.toggle()
                            } label: {
                                Image(systemName: "questionmark.circle")
                                    .foregroundColor(.primary)
                                    .fontWeight(.bold)
                            }
                            Button {
                                withAnimation {
                                    showStats.toggle()
                                }
                            } label: {
                                Image(systemName: "chart.bar")
                                    .foregroundColor(.primary)
                                    .fontWeight(.bold)
                            }
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(.primary)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
            }
            if dm.showStats {
                StatsView()
            }
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showHelp) {
            HelpView()
        }
        .sheet(isPresented: $showStats) {
            StatsView()
        }
        
    }
}

#Preview {
    GameView()
}
