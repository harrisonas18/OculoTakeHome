//
//  GoalCellView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI

struct GoalCellViewDisabled: View {
    
    @State var cellText = "Test"
    
    var body: some View {
        Text(cellText)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Colors.cellSubTitleText)
            .background(Colors.goalCellBackground)
            .cornerRadius(8)
    }
}

struct GoalCellView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCellViewDisabled()
    }
}
