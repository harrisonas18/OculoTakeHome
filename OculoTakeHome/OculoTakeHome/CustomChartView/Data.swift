//
//  Data.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/17/23.
//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import Foundation

func date(year: Int, month: Int, day: Int = 1, hour: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day, hour: hour, minute: minutes, second: seconds)) ?? Date()
}

enum Constants {
    static let previewChartHeight: CGFloat = 100
    static let detailChartHeight: CGFloat = 65
}

// MARK: - Time Sheet data

class DataHelpers {
    static func getEventsTotalDuration(_ events: [(category: String, clockIn: Date, clockOut: Date)]) -> String {
        var durationInSeconds: TimeInterval = 0
        for event in events {
            durationInSeconds += event.clockIn.distance(to: event.clockOut)
        }
        return getFormattedDuration(seconds: durationInSeconds)
    }

    static func getFormattedDuration(seconds: Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute]

        return formatter.string(from: seconds) ?? "N/A"
    }
}

enum TimeSheetData {
    static let sleep = [
        /// Sleep
        (category: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 08, minutes: 00), clockOut: date(year: 2022, month: 6, day: 13, hour: 09, minutes: 28)),
        (category: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 09, minutes: 47), clockOut: date(year: 2022, month: 6, day: 13, hour: 12, minutes: 04)),
        (category: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 13, minutes: 01), clockOut: date(year: 2022, month: 6, day: 13, hour: 15, minutes: 10)),
        (category: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 15, minutes: 33), clockOut: date(year: 2022, month: 6, day: 13, hour: 17, minutes: 01)),
        (category: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 17, minutes: 02), clockOut: date(year: 2022, month: 6, day: 13, hour: 18, minutes: 08))
        ]
    
    static let activity = [
        /// Sleep
        (category: "Activity", clockIn: date(year: 2022, month: 6, day: 13, hour: 08, minutes: 00), clockOut: date(year: 2022, month: 6, day: 13, hour: 08, minutes: 28)),
        (category: "Activity", clockIn: date(year: 2022, month: 6, day: 13, hour: 09, minutes: 47), clockOut: date(year: 2022, month: 6, day: 13, hour: 10, minutes: 04)),
        (category: "Activity", clockIn: date(year: 2022, month: 6, day: 13, hour: 13, minutes: 01), clockOut: date(year: 2022, month: 6, day: 13, hour: 13, minutes: 10)),
        (category: "Activity", clockIn: date(year: 2022, month: 6, day: 13, hour: 15, minutes: 33), clockOut: date(year: 2022, month: 6, day: 13, hour: 16, minutes: 01)),
        (category: "Activity", clockIn: date(year: 2022, month: 6, day: 13, hour: 17, minutes: 02), clockOut: date(year: 2022, month: 6, day: 13, hour: 17, minutes: 16))
        ]
    
    static let caffeine = [
        /// Sleep
        (category: "Caffeine", clockIn: date(year: 2022, month: 6, day: 13, hour: 08, minutes: 00), clockOut: date(year: 2022, month: 6, day: 13, hour: 09, minutes: 28)),
        ]
    
}

extension Date {
	static var startOfDay: Date {
		Calendar.current.startOfDay(for: .now)
	}
}

extension Date {
	func nearestHour() -> Date? {
		var components = NSCalendar.current.dateComponents([.minute, .second, .nanosecond], from: self)
		let minute = components.minute ?? 0
		let second = components.second ?? 0
		let nanosecond = components.nanosecond ?? 0
		components.minute = minute >= 30 ? 60 - minute : -minute
		components.second = -second
		components.nanosecond = -nanosecond
		return Calendar.current.date(byAdding: components, to: self)
	}
}

extension Array {
	func appending(contentsOf: [Element]) -> Array {
		var a = Array(self)
		a.append(contentsOf: contentsOf)
		return a
	}
}
