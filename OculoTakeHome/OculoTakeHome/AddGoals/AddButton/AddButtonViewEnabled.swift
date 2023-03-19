//
//  GoalsAddButtonView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/18/23.
//

import SwiftUI

struct AddButtonViewEnabled: View {
    
    var body: some View {
        Text("ADD")
            .padding()
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(Colors.goalCellBackground)
            .background(Colors.addGoalsButtonBackgroundEnabled)
            .cornerRadius(16)
    }
    
}

struct GoalsAddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonViewEnabled()
    }
}
