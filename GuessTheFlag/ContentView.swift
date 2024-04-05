//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by allyne fernanda  on 29/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy","Nigeria","Poland","Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...3)
    
    
    @State private var showingScore = false
    @State private var scoreTtiltle = ""
    @State private var score = 1
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack{
                Spacer()
                
                Text("Guess the flag").font(.largeTitle.bold()).foregroundStyle(.white)
                
                VStack(spacing: 30){
                    VStack{
                        Text("Tap the flag of").foregroundStyle(.secondary).font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<4) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number]).clipShape(.capsule).shadow(radius: 6)
                        }
                    }

                    
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                
               Spacer()
                Spacer()
                
                Text("Score ???").foregroundStyle(.white).font(.title.bold())
            
                Spacer()
            }
            .padding()
        }.alert(scoreTtiltle,isPresented: $showingScore){
            Button("Continua", action: askQuestion)
        }message:{
            Text("Your score is \(score)")
            }
    }
    func resetGame() {
        score = 0
    }

    func flagTapped(_ number: Int) {
       
        if number == correctAnswer {
            scoreTtiltle = "Correct"
            score += 1
        } else {
            scoreTtiltle = "Wrong"
        }
        showingScore = true
        
        if score == 8 {
            
            scoreTtiltle = "Game Over"
            resetGame()
        
            
        }
        
    }
        
        func askQuestion(){
            countries.shuffle()
            correctAnswer = Int.random(in:0...3)
        }
    }


    #Preview {
        ContentView()
    }

