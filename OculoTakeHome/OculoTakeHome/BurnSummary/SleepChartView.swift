//
//  SleepChartView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI
import Charts

struct SleepChartView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8){
                Text("Sleep")
                    .foregroundColor(Colors.cellTitleText)
                Text("You slept less than 8 hours last night")
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
                .foregroundColor(Colors.sleepCellChartData)
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

struct SleepChartView_Previews: PreviewProvider {
    static var previews: some View {
        SleepChartView()
    }
}
