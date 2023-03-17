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
                TimeSheetChartView(isOverview: false)
                    .frame(height: 125)
                    .scrollDisabled(true)
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
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
