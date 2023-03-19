//
//  AddGoalsPopoverViewModel.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import Foundation

class AddGoalsPopoverViewModel: ObservableObject {
    
    @Published var goals = [
        Goal(title: "Spend 30 minutes on activity", isSelected: false),
        Goal(title: "Finish eating 2 hours before bedtime", isSelected: false),
        Goal(title: "Take a cold shower", isSelected: false),
        Goal(title: "Sleep 8 hours", isSelected: false),
        Goal(title: "Do morning meditation", isSelected: false)
    ]

}
