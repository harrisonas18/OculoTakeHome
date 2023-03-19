//
//  CategoryChartView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/18/23.
//

import SwiftUI
import Charts

struct CategoryChartView: View {
    
    @State var category: Category
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8){
                Text(category.title)
                    .foregroundColor(category.titleTextColor)
                Text(category.subTitleText)
                    .foregroundColor(category.subTitleTextColor)
                TimeSheetChartView(data: category.timeSheetChartViewModel.data,
                                   startOfOpeningHours: category.timeSheetChartViewModel.openingHoursStart,
                                   endOfOpeningsHours: category.timeSheetChartViewModel.openingHoursEnd,
                                   weekStart: category.timeSheetChartViewModel.weekStart,
                                   weekEnd: category.timeSheetChartViewModel.weekEnd)
                    .frame(height: 60)
            }
            Spacer()
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Colors.factorCellBorder, lineWidth: 1)
        )
    
    }
    
}

struct CategoryChartView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryChartView(category: .Sleep)
    }
}
