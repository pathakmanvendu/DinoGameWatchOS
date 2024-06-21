//
//  DinoStateModel.swift
//  DinoGameWatchos Watch App
//
//  Created by manvendu pathak  on 21/06/24.
//

import Foundation

enum DinoStateModel: Int, CaseIterable, Identifiable {
    case idle
    case walking
    case jump
    case gameover
    
    var id : Int  {return rawValue}
    
    var imageName: String {
        switch self {
        case .idle:
            return "dinoLeft"
        case .walking:
            return "dino"
        case .jump:
            return "dinoLeft"
        case .gameover:
            return "dinoDead"
        }
    }
}
