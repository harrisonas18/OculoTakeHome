//
//  ActivityChartView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI
import Charts

struct ActivityChartView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8){
                Text("Activity")
                    .foregroundColor(Colors.cellTitleText)
                Text("You slept less than 2 hours on activities")
                    .foregroundColor(Colors.cellSubTitleText)
                Chart {
                    BarMark(
                            x: .value("Shape Type", "12 AM - 02 AM"),
                            y: .value("Total Count", 1)
                        )
                    BarMark(
                            x: .value("Shape Type", "02 AM"),
                            y: .value("Total Count", 1)
                        )
                    BarMark(
                            x: .value("Shape Type", "04 AM"),
                            y: .value("Total Count", 1)
                        )
                    BarMark(
                            x: .value("Shape Type", "06 AM"),
                            y: .value("Total Count", 1)
                        )
                    BarMark(
                            x: .value("Shape Type", "08 AM"),
                            y: .value("Total Count", 1)
                        )
                }
                .foregroundColor(Colors.activityCellChartData)
                .frame(height: 50)
            }
            Spacer()
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Colors.factorCellBorder, lineWidth: 1)
        )
    }
}

struct ActivityChartView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityChartView()
    }
}
