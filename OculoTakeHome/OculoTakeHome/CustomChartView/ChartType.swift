//
//  ChartType.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/17/23.
//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import SwiftUI

enum ChartCategory: String, CaseIterable, Hashable, Identifiable {
	case all
    case apple
    case line
    case bar
    case area
    case range
    case heatMap
    case point

	var id: String { self.rawValue }

	var sfSymbolName: String {
		switch self {
		case .all:
			return ""
        case .apple:
            return "applelogo"
        case .line:
            return "chart.xyaxis.line"
        case .bar:
            return "chart.bar.fill"
        case .area:
            return "triangle.fill"
        case .range:
            return "trapezoid.and.line.horizontal.fill"
        case .heatMap:
            return "checkerboard.rectangle"
        case .point:
            return "point.3.connected.trianglepath.dotted"
		}
	}
}

enum ChartType: String, Identifiable, CaseIterable {

    // Bar Charts
    case timeSheetBar


	var id: String { self.rawValue }

    var title: String {
        switch self {
        case .timeSheetBar:
            return "Time Sheet Bar"
        }
    }

    var category: ChartCategory {
        switch self {
        case .timeSheetBar:
            return .bar
        }
    }

}
