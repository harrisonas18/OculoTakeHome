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

enum TimeSheetData {
    static let lastDay = [
        /// Sleep
        (department: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 08, minutes: 00), clockOut: date(year: 2022, month: 6, day: 13, hour: 09, minutes: 28)),
        (department: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 09, minutes: 47), clockOut: date(year: 2022, month: 6, day: 13, hour: 12, minutes: 04)),
        (department: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 13, minutes: 01), clockOut: date(year: 2022, month: 6, day: 13, hour: 15, minutes: 10)),
        (department: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 15, minutes: 33), clockOut: date(year: 2022, month: 6, day: 13, hour: 17, minutes: 01)),
        (department: "Sleep", clockIn: date(year: 2022, month: 6, day: 13, hour: 17, minutes: 02), clockOut: date(year: 2022, month: 6, day: 13, hour: 18, minutes: 08))
        ]
    /// Time Sheet Date for the last week
    static let lastWeek = [
        /// Monday
        (department: "Bread", clockIn: date(year: 2022, month: 6, day: 13, hour: 08, minutes: 00), clockOut: date(year: 2022, month: 6, day: 13, hour: 09, minutes: 28)),
        (department: "Bread", clockIn: date(year: 2022, month: 6, day: 13, hour: 09, minutes: 47), clockOut: date(year: 2022, month: 6, day: 13, hour: 12, minutes: 04)),
        (department: "Butchery", clockIn: date(year: 2022, month: 6, day: 13, hour: 13, minutes: 01), clockOut: date(year: 2022, month: 6, day: 13, hour: 15, minutes: 10)),
        (department: "Butchery", clockIn: date(year: 2022, month: 6, day: 13, hour: 15, minutes: 33), clockOut: date(year: 2022, month: 6, day: 13, hour: 17, minutes: 01)),
        (department: "Vegetables", clockIn: date(year: 2022, month: 6, day: 13, hour: 17, minutes: 02), clockOut: date(year: 2022, month: 6, day: 13, hour: 18, minutes: 08)),
        /// Tuesday
        (department: "Bread", clockIn: date(year: 2022, month: 6, day: 14, hour: 08, minutes: 00), clockOut: date(year: 2022, month: 6, day: 14, hour: 09, minutes: 28)),
        (department: "Bread", clockIn: date(year: 2022, month: 6, day: 14, hour: 09, minutes: 47), clockOut: date(year: 2022, month: 6, day: 14, hour: 12, minutes: 04)),
        (department: "Bread", clockIn: date(year: 2022, month: 6, day: 14, hour: 13, minutes: 01), clockOut: date(year: 2022, month: 6, day: 14, hour: 15, minutes: 10)),
        (department: "Bread", clockIn: date(year: 2022, month: 6, day: 14, hour: 15, minutes: 33), clockOut: date(year: 2022, month: 6, day: 14, hour: 17, minutes: 01)),
        /// Wednesday
        (department: "Counter", clockIn: date(year: 2022, month: 6, day: 15, hour: 15, minutes: 58), clockOut: date(year: 2022, month: 6, day: 15, hour: 18, minutes: 34)),
        (department: "Counter", clockIn: date(year: 2022, month: 6, day: 15, hour: 19, minutes: 03), clockOut: date(year: 2022, month: 6, day: 15, hour: 22, minutes: 10)),
        /// Thursday
        (department: "Vegetables", clockIn: date(year: 2022, month: 6, day: 17, hour: 05, minutes: 15), clockOut: date(year: 2022, month: 6, day: 17, hour: 06, minutes: 13)),
        (department: "Vegetables", clockIn: date(year: 2022, month: 6, day: 17, hour: 06, minutes: 33), clockOut: date(year: 2022, month: 6, day: 17, hour: 08, minutes: 52)),
        (department: "Vegetables", clockIn: date(year: 2022, month: 6, day: 17, hour: 09, minutes: 15), clockOut: date(year: 2022, month: 6, day: 17, hour: 11, minutes: 46)),
        (department: "Vegetables", clockIn: date(year: 2022, month: 6, day: 17, hour: 12, minutes: 58), clockOut: date(year: 2022, month: 6, day: 17, hour: 14, minutes: 26)),
        (department: "Vegetables", clockIn: date(year: 2022, month: 6, day: 17, hour: 15, minutes: 05), clockOut: date(year: 2022, month: 6, day: 17, hour: 15, minutes: 51)),
        (department: "Vegetables", clockIn: date(year: 2022, month: 6, day: 17, hour: 19, minutes: 33), clockOut: date(year: 2022, month: 6, day: 17, hour: 21, minutes: 01))
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
