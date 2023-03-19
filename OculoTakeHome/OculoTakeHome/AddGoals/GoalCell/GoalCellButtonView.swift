//
//  GoalCellButtonView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/18/23.
//

import SwiftUI

struct GoalCellButtonView: View {
    
    @State var goal: Goal
    
    var body: some View {
        Button {
            goal.isSelected.toggle()
        } label: {
            if goal.isSelected {
                GoalCellViewEnabled(cellText: goal.title)
            } else {
                GoalCellViewDisabled(cellText: goal.title)
            }
            
        }
    }
}

struct GoalCellButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCellButtonView(goal: Goal(title: "Placeholder", isSelected: false))
    }
}
