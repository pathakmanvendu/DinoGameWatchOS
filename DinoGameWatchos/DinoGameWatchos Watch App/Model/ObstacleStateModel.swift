//
//  ObstacleStateModel.swift
//  DinoGameWatchos Watch App
//
//  Created by manvendu pathak  on 21/06/24.
//

import Foundation

enum ObstacleStateModel: Int, CaseIterable, Identifiable {
    case obs1
    case obs2
    case obs3
    case obs4
    case obs5
    
    var id: Int {return rawValue}
    
    var imageName: String {
        switch self {
            
        case .obs1:
            return "cactus1"
        case .obs2:
            return "cactus2"
        case .obs3:
            return "cactus3"
        case .obs4:
            return "doubleCactus"
        case .obs5:
            return "tripleCactus"
        }
    }
}
