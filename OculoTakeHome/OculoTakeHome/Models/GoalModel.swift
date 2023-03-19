//
//  GoalModel.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/18/23.
//

import Foundation

struct Goal: Identifiable {
    
    let id: String = UUID().uuidString
    let title: String
    var isSelected: Bool
    
}
