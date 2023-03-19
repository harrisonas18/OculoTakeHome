//
//  CategoryModel.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/18/23.
//

import Foundation
import SwiftUI

enum Category {
    
    case Sleep
    case Activity
    case Caffeine
    
    var title: String {
        switch self {
        case .Sleep:
            return "Sleep"
        case .Activity:
            return "Activity"
        case .Caffeine:
            return "Caffeine"
        }
    }
    
    var titleTextColor: Color {
        switch self {
        case .Sleep:
            return Colors.cellTitleText
        case .Activity:
            return Colors.cellTitleText
        case .Caffeine:
            return Colors.cellTitleText
        }
    }
    
    var subTitleText: String {
        switch self {
        case .Sleep:
            return "You slept \(DataHelpers.getEventsTotalDuration(TimeSheetData.sleep)) hours last night"
        case .Activity:
            return "You spent \(DataHelpers.getEventsTotalDuration(TimeSheetData.activity)) hours on activities"
        case .Caffeine:
            return "You drank 6 hours before sleep"
        }
    }
    
    var subTitleTextColor: Color {
        switch self {
        case .Sleep:
            return Colors.cellSubTitleText
        case .Activity:
            return Colors.cellSubTitleText
        case .Caffeine:
            return Colors.cellSubTitleText
        }
    }
    
    var timeSheetChartViewModel: TimeSheetChartModel {
        switch self {
        case .Sleep:
            return TimeSheetChartModel(data: TimeSheetData.sleep,
                                       openingHoursStart: date(year: 2022, month: 6, day: 13, hour: 05, minutes: 00),
                                       openingHoursEnd: date(year: 2022, month: 6, day: 13, hour: 22, minutes: 00),
                                       weekStart: date(year: 2022, month: 6, day: 13, hour: 05, minutes: 00),
                                       weekEnd: date(year: 2022, month: 6, day: 18, hour: 20, minutes: 00))
        case .Activity:
            return TimeSheetChartModel(data: TimeSheetData.activity,
                                       openingHoursStart: date(year: 2022, month: 6, day: 13, hour: 05, minutes: 00),
                                       openingHoursEnd: date(year: 2022, month: 6, day: 13, hour: 22, minutes: 00),
                                       weekStart: date(year: 2022, month: 6, day: 13, hour: 05, minutes: 00),
                                       weekEnd: date(year: 2022, month: 6, day: 18, hour: 20, minutes: 00))
        case .Caffeine:
            return TimeSheetChartModel(data: TimeSheetData.caffeine,
                                       openingHoursStart: date(year: 2022, month: 6, day: 13, hour: 05, minutes: 00),
                                       openingHoursEnd: date(year: 2022, month: 6, day: 13, hour: 22, minutes: 00),
                                       weekStart: date(year: 2022, month: 6, day: 13, hour: 05, minutes: 00),
                                       weekEnd: date(year: 2022, month: 6, day: 18, hour: 20, minutes: 00))
        }
    }
    
}
