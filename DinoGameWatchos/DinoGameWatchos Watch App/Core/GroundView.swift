//
//  GroundView.swift
//  DinoGameWatchos Watch App
//
//  Created by manvendu pathak  on 21/06/24.
//

import SwiftUI

struct GroundView: View {
    @State private var groundPosX = 900.0
    @Binding var dinoState: DinoStateModel
    var body: some View {
        ZStack {
            Image("way")
                .resizable()
                .scaledToFit()
                .frame(width: 2900)
                .offset(x: groundPosX)
                .opacity(dinoState != .gameover ? 1 : 0)
            Image("way")
                .resizable()
                .scaledToFit()
                .frame(width: 2900)
                .offset(x: 29)
                .opacity(dinoState != .gameover ? 0 : 1)
        }
        .frame(width: 429)
        .clipped()
        .onAppear{
            withAnimation(.linear(duration: 12.9).repeatForever(autoreverses: false)){
                groundPosX = -900
            }

        }
    }
}

#Preview {
    GroundView(dinoState: .constant(.walking))
}
