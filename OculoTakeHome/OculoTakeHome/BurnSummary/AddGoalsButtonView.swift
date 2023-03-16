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
            Image(systemName: "staroflife.fill")
                .resizable()
                .foregroundColor(Colors.cellSubTitleText)
                .frame(width: 32, height: 32)
                .aspectRatio(contentMode: .fill)
            Text("Complete goals to improve your health and burn")
                .foregroundColor(Colors.cellSubTitleText)
                .fontWeight(.semibold)
                .font(.system(size: 18))
                .multilineTextAlignment(.leading)
            Image(systemName: "arrow.right")
                .foregroundColor(Colors.cellSubTitleText)
                
        }
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
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
