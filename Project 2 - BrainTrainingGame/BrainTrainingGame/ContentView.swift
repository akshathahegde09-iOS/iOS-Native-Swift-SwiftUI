//
//  ContentView.swift
//  BrainTrainingGame
//
//  Created by Akshatha Hegde on 12/17/24.
//

import SwiftUI


struct ContentView: View {
    
    @State private var currentChoice = 0
    @State private var shouldWin = true
    @State private var score = 0
    @State private var rounds = 0
    
    private let totoalRounds = 10
    
    let moves = ["🪨", "📄", "✂️"]
    
    var body: some View {
        VStack(spacing: 30)
        {
            Text("Rock, Paper, Scissors")
                .font(.largeTitle.bold())
            
            Text("Round \(rounds + 1) of \(totoalRounds)")
                .font(.title)
            
            Text("App Chose:")
                .font(.title2)
            
            Text(moves[currentChoice])
                .font(.system(size: 100))
            
            Text(shouldWin ? "You need to WIN!" : "You need to Lose!")
                .font(.title)
                .foregroundColor(.blue)
            
            HStack(spacing: 20) {
                ForEach(0..<3) { index in
                    Button(action: {
                        playerTapped(move: index)
                    }) {
                        Text(moves[index])
                            .font(.system(size: 80))
                    }
                }
            }
            .padding()
            
            Text("Score: \(score)")
                .font(.title.bold())
            
            if rounds >= totoalRounds {
                VStack {
                    Text("Game Over!")
                        .font(.largeTitle.bold())
                        .foregroundColor(.red)
                    Button(action: restartGame){
                        Text("Restart Game")
                            .font(.title2)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
        .onAppear(perform: startNewRound)
    }
    
    func startNewRound() {
        currentChoice = Int.random(in: 0..<3)
        shouldWin.toggle()
    }
    
    func playerTapped(move: Int) {
        guard rounds <= totoalRounds else { return }
        
        let correctMove = calculateCorrectMove()
        
        if move == correctMove {
            score += 1
        } else {
            score -= 1
        }
        
        rounds += 1
        if rounds < totoalRounds {
            startNewRound()
        }
    }
    
    func calculateCorrectMove() -> Int {
        if shouldWin {
            switch currentChoice {
            case 0 : return 1
            case 1: return 2
            default: return 0
            }
        } else {
            switch currentChoice {
            case 0: return 2
            case 1: return 0
            default: return 1
            }
        }
    }
        
        func restartGame() {
                score = 0 // Reset score
                rounds = 0 // Reset round count
                startNewRound() // Start a new round
            }
}
    
#Preview {
    ContentView()
}
