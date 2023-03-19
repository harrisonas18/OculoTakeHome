//
//  TimeSheetChartModel.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/18/23.
//

import Foundation

struct TimeSheetChartModel {
    
    let data: [(category: String, clockIn: Date, clockOut: Date)]
    let openingHoursStart: Date
    let openingHoursEnd: Date
    let weekStart: Date
    let weekEnd: Date
    
}

