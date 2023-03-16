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
                            x: .value("Shape Type", "Cube"),
                            y: .value("Total Count", 5)
                        )
                    BarMark(
                            x: .value("Shape Type", "Sphere"),
                            y: .value("Total Count", 6)
                        )
                    BarMark(
                            x: .value("Shape Type", "Square"),
                            y: .value("Total Count", 3)
                        )
                    BarMark(
                            x: .value("Shape Type", "Circle"),
                            y: .value("Total Count", 1)
                        )
                }
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
