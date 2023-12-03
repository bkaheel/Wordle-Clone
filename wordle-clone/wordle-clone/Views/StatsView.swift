//
//  StatsView.swift
//  wordle-clone
//
//  Created by Benjamin Kaheel on 11/23/23.
//

import SwiftUI

struct StatsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dm: WordleDataModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                    Text("STATISTICS")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.leading, -150)
                
                HStack(alignment: .top, spacing: 25) {
                    SingleStat(value: dm.currentStat.games, text: "Played")
                    if dm.currentStat.games != 0 {
                        SingleStat(value: dm.currentStat.wins/dm.currentStat.games, text: "Win %")
                    }
                    SingleStat(value: dm.currentStat.streak, text: "Current Streak")
                        .fixedSize(horizontal: false, vertical: true)
                    SingleStat(value: dm.currentStat.maxStreak, text: "Max Streak")
                        .fixedSize(horizontal: false, vertical: true)
                }
                Text("GUESS DISTRIBUTION")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading, -150)
                
                VStack(spacing: 5) {
                    ForEach(0..<6) { index in
                        HStack {
                            Text("\(index + 1)")
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                            
                            
                            if dm.currentStat.frequencies[index] == 0 {
                                Rectangle()
                                    .fill(Color.Wrong)
                                    .frame(width: 22, height: 15)
                                    .overlay(
                                        Text("0")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                            .fontWeight(.bold)
                                    )
                            } else {
                                if let maxValue = dm.currentStat.frequencies.max() {
                                    Rectangle()
                                        .fill((dm.tryIndex == index && dm.gameOver) ? Color.Correct : Color.Wrong)
                                        .frame(width: CGFloat(dm.currentStat.frequencies[index]) / CGFloat(maxValue) * 210, height: 15)
                                        .overlay(
                                            Text("\(dm.currentStat.frequencies[index])")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12))
                                                .fontWeight(.bold)
                                                .padding(.horizontal, 5)
                                            , alignment: .trailing)
                                }
                            }
                            Spacer()
                        }
                    }
                }
                Spacer()
            }

            .frame(width: 320)
            .padding()
            .shadow(color: .black.opacity(0.2), radius: 8)
            
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

struct SingleStat: View {
    let value: Int
    let text: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.title)
            Text(text)
                .font(.caption)
                .frame(width: 50)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    StatsView()
        .environmentObject(WordleDataModel())
}
