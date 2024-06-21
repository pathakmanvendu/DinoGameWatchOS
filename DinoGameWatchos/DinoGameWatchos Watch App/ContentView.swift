//
//  ContentView.swift
//  DinoGameWatchos Watch App
//
//  Created by manvendu pathak  on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State var getScore = 0
    @State var isGameStart: Bool = false
    @State var dinoPosY = 0.0
    @State var dinoState : DinoStateModel = .walking
    @State var colliderHit = false
    @State private var playLabelOpacity = 1.0
    
    var body: some View {
        ZStack{
            CloudsView()
                .offset(y: 20)
            ObstacleView(colliderHit: $colliderHit, isGameStart: $isGameStart, getScore: $getScore, dinoPosY: $dinoPosY, dinoState: $dinoState)
                .offset(y: -40)
            scoreLabel
                .offset(y: -58)
            
            GroundView(dinoState: $dinoState)
                .offset(y: 60)
            DinoView(dinoPosY: $dinoPosY, dinoState: $dinoState, isGameStart: $isGameStart)
                .offset(y: 42)
            replayButton
                .offset(y: -29)
            playLabel
        }
        .scaleEffect(0.54)
    }
}

extension ContentView{
    private var scoreLabel : some View {
        HStack{
            Text("HI \(String(format: "%.5d", getScore))")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color(.darkGray))
        }
        .frame(maxWidth: 350, maxHeight: .infinity, alignment: .topTrailing)
        .padding()
        .zIndex(1)
    }
    private var replayButton: some View {
        VStack{
            if dinoState == .gameover {
                Button {
                    dinoPosY = -7
                    dinoState = .walking
                    colliderHit = false
                    isGameStart = true
                    score = 0
                    getScore = 0
                    
                } label: {
                    VStack{
                        
                        Image("btn-play-again")
                            .resizable()
                            .scaledToFit()
                            .frame(width:40)
                        Text("play again".uppercased())
                            .font(.title2)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                    }
                }
                .padding()
            }
        }
    }
    
    private var playLabel: some View {
        VStack{
            
            Text("Touch Dino".uppercased())
            Text("to Play")
                .font(.title2)
                .foregroundColor(.gray)
                .fontWeight(.bold)
        }
        .opacity(playLabelOpacity)
        .onAppear{
            withAnimation(.spring().delay(2)){
                playLabelOpacity = 0.0
            }
        }
    }
}

#Preview {
    ContentView()
}
