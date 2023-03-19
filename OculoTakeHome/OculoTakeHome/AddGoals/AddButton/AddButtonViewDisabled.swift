//
//  AddButtonViewDisabled.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/18/23.
//

import SwiftUI

struct AddButtonViewDisabled: View {
    
    var body: some View {
        Text("ADD")
            .padding()
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(Colors.addGoalsButtonText)
            .background(Colors.addGoalsButtonBackgroundDisabled)
            .cornerRadius(16)
    }
    
}

struct AddButtonViewDisabled_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonViewDisabled()
    }
}
