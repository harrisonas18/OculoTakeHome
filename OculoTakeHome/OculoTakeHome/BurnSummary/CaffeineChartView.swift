//
//  CaffeineChartView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI
import Charts

struct CaffeineChartView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8){
                Text("Caffeine")
                    .foregroundColor(Colors.cellTitleText)
                Text("You drank 6 hours before sleep")
                    .foregroundColor(Colors.cellSubTitleText)
                Chart {
                    BarMark(
                            x: .value("Shape Type", "12 AM - 02 AM")
                        )
                    BarMark(
                            x: .value("Shape Type", "02 AM - 04 AM")
                        )
                    BarMark(
                            x: .value("Shape Type", "04 AM - 06 AM")
                        )
                    BarMark(
                            x: .value("Shape Type", "06 AM - 08 AM")
                        )
                    BarMark(
                            x: .value("Shape Type", "08 AM - 10 AM")
                        )
                }
                .foregroundColor(Colors.caffeineCellChartData)
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

struct CaffeineChartView_Previews: PreviewProvider {
    static var previews: some View {
        CaffeineChartView()
    }
}
