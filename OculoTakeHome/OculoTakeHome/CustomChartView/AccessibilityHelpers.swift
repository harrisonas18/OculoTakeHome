//
//  AccessibilityHelpers.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/17/23.
//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import SwiftUI

extension TimeInterval {
    var accessibilityDurationFormatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .brief
        formatter.maximumUnitCount = 1
        
        return formatter
    }
    
    var durationDescription: String {
        let hqualifier = (hours == 1) ? "hour" : "hours"
        let mqualifier = (minutes == 1) ? "minute" : "minutes"
        
        return accessibilityDurationFormatter.string(from: self) ??
        String(format:"%d \(hqualifier) %02d \(mqualifier)", hours, minutes)
    }

    var hours: Int {
        Int((self/3600).truncatingRemainder(dividingBy: 3600))
    }
    
    var minutes: Int {
        Int((self/60).truncatingRemainder(dividingBy: 60))
    }
}

extension Date {
    // Used for charts where the day of the week is used: visually  M/T/W etc
    // (but we want VoiceOver to read out the full day)
    var weekdayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"

        return formatter.string(from: self)
    }
}

