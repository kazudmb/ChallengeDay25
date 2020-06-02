//
//  ContentView.swift
//  ChallengeDay25
//
//  Created by KazukiNakano on 2020/06/02.
//  Copyright © 2020 kazu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var possibleMoves = ["Rock", "Paper", "Scissors"]
    
    @State private var appsCurrentChoiceOfMovesIndex = 0
        
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var showingScore = false
    
    @State private var result = 0
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                
                HStack {
                    Text("Your score is")
                        .foregroundColor(.primary)
                    Text("\(score)")
                        .foregroundColor(.primary)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.MoveTapped(number)
                    }) {
                        Text(self.possibleMoves[number])
                    }
                }
                
                Spacer()
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message:
                    Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    })
            }
        }
    }
    
    func MoveTapped(_ number: Int) { number
        
        appsCurrentChoiceOfMovesIndex = Int.random(in: 0...2)
        
        result = (number + appsCurrentChoiceOfMovesIndex + 3) % 3
        switch result {
        case 0:
            scoreTitle = "Draw"
        case 1:
            scoreTitle = "You Win"
            score += 1
        case 2:
            scoreTitle = "You Lose"
        default:
            scoreTitle = "Error"
        }
        
        showingScore = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
