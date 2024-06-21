//
//  CloudsView.swift
//  DinoGameWatchos Watch App
//
//  Created by manvendu pathak  on 21/06/24.
//

import SwiftUI

struct CloudsView: View {
    @State private var cloudPosX = [300.0,300.0,300]
    @State private var cloudPosy = [-60,-70.0,-40]
    var body: some View {
        ZStack{
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(height:15)
                .offset(x:cloudPosX[2],y:cloudPosy[2])
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(height:29)
                .offset(x:cloudPosX[0],y:cloudPosy[0])
            Image("cloud")
                .resizable()
                .scaledToFit()
                .scaleEffect(x: -1)
                .frame(height:29)
                .offset(x:cloudPosX[1],y:cloudPosy[1])
        }
        .onAppear{
            withAnimation(.linear(duration: 30).repeatForever(autoreverses: false)){
                cloudPosX[2] = -258.0
            }
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)){
                cloudPosX[0] = -258.0
            }
            withAnimation(.linear(duration: 15).repeatForever(autoreverses: false)){
                cloudPosX[1] = -258.0
            }
            
            
            
        }
    }
}

#Preview {
    CloudsView()
}
