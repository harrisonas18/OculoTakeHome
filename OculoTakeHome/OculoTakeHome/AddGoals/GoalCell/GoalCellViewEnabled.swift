//
//  GoalCellViewEnabled.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI

struct GoalCellViewEnabled: View {
    
    @State var cellText = "Test"
    
    var body: some View {
        HStack {
            Text(cellText)
                .foregroundColor(Colors.cellSubTitleText)
            Spacer()
            Image(systemName: "checkmark")
                .foregroundColor(Colors.addGoalsButtonBackgroundEnabled)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Colors.addGoalHighlightedCellBackground)
        .cornerRadius(8)
    }
}

struct GoalCellViewEnabled_Previews: PreviewProvider {
    static var previews: some View {
        GoalCellViewEnabled()
    }
}
