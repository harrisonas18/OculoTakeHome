//
//  AddGoalsButtonView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI

struct AddGoalsButtonView: View {
    var body: some View {
        HStack(spacing: 16){
            Image("starOfLife")
                .resizable()
                .foregroundColor(Colors.cellSubTitleText)
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fill)
            Text("Complete goals to improve your health and burn")
                .foregroundColor(Colors.cellSubTitleText)
                .fontWeight(.medium)
                .font(.system(size: 16))
                .multilineTextAlignment(.leading)
            Spacer()
            Image("caretRight")
                .foregroundColor(Colors.cellSubTitleText)
                
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity)
        .background(Colors.addGoalsPopoverButton)
        .cornerRadius(8)
    }
}

struct AddGoalsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalsButtonView()
    }
}
