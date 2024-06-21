//
//  DinoView.swift
//  DinoGameWatchos Watch App
//
//  Created by manvendu pathak  on 21/06/24.
//

import SwiftUI

struct DinoView: View {
    @State private var dinoCurrentImage = UIImage(named: "dinoLeft")!
    @Binding var dinoPosY: Double
    @State var dinoPosX = -60.0
    @Binding var dinoState : DinoStateModel
    let timer = Timer.publish(every: 0.0258, on: .main, in: .common).autoconnect()
    @State private var isJumping = false
    @State private var isFixPosX = false
    @Binding  var isGameStart : Bool
    var body: some View {
        ZStack {
            dinoImageView
                .offset(x: dinoPosX, y: dinoPosY)
                .onAppear{
                    getDinoState(state: dinoState)
                    getDinoState(state: .jump)
                }
                .onChange(of: dinoState) { newDinoState in
                    getDinoState(state: newDinoState)
                }
                .onTapGesture {
                    if dinoState == .walking {
                        getDinoState(state: .jump)
                        isGameStart = true
                    }
                }
        }
        .onReceive(timer) { _ in
            
            if dinoState == .jump {
                if dinoPosY > -92 && !isJumping{
                    dinoPosY -= 14
                    // dinoPosX += 3.29
                }
                else if dinoPosY > -158 && !isJumping{
                    dinoPosY -= 10
                    // dinoPosX += 3.29
                }
                else if dinoPosY > -207 && !isJumping{
                    dinoPosY -= 5
                    // dinoPosX += 3.29
                }
                
                else if dinoPosY < -7 && isJumping{
                    dinoPosY += 10
                    // dinoPosX += 3.29
                }
                
                
                
                if dinoPosY <= -207 {
                    isJumping = true
                    isFixPosX = false
                }
                else if dinoPosY >= -7 && isJumping {
                    isJumping = false
                    getDinoState(state: .walking)
                }
            }
            else if dinoState == .walking {
                if !isFixPosX {
                    isFixPosX.toggle()
                    
                }
            }
        }
    }
    
}

extension DinoView {
   private  var dinoImageView: some View  {
        Image(uiImage: dinoCurrentImage)
            .resizable()
            .scaledToFit()
            .frame(height: 60)
    }
    
    func getDinoState(state newDinoState: DinoStateModel){
        dinoState = newDinoState
        switch newDinoState {
        case .walking:
            dinoCurrentImage = UIImage(named: "\(dinoState.imageName)Left")!
            
            withAnimation(.spring(response: 0.6).repeatForever()){
                dinoCurrentImage = UIImage(named: "\(dinoState.imageName)Right")!
            }
        case .jump:
            dinoCurrentImage = UIImage(named: newDinoState.imageName)!
        default:
            dinoCurrentImage = UIImage(named: newDinoState.imageName)!
        }
    }
}

struct DinoView_Previews: PreviewProvider {
    static var previews: some View {
        DinoView(dinoPosY: .constant(0), dinoState: .constant(.walking), isGameStart: .constant(false))
    }
}
