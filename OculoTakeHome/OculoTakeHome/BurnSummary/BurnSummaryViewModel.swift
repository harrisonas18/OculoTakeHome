//
//  BurnSummaryViewModel.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import Foundation

class BurnSummaryViewModel: ObservableObject {
    
    @Published var showAddGoalsPopover = false
    @Published var categories: [Category]  = [.Sleep, .Activity, .Caffeine]
    @Published var burnModel = BurnModel(burnRate: "87", time: "Today, 12:47 PM")
    
}
