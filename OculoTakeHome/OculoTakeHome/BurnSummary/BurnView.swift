//
//  BurnView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI

struct BurnView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    gradient: .init(colors: [Colors.burnGraphicGradient2, Colors.burnGraphicGradient1]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  ))
                .blur(radius: 24)
                .frame(width: 250, height: 250)
            Circle()
                .strokeBorder(Colors.caffeineCellChartData)
                .frame(width: 300, height: 300)
                .opacity(50.0)
            Circle()
                .strokeBorder(Colors.goalCellBackground)
                .frame(width: 200, height: 200)
                .opacity(50.0)
            Circle()
                .strokeBorder(Colors.goalCellBackground)
                .frame(width: 100, height: 200)
                .opacity(50.0)
            VStack {
                Text("87")
                    .foregroundColor(Colors.cellSubTitleText)
                    .fontWeight(.bold)
                    .font(.system(size: 32))
                Text("Today, 12:45 PM")
                    .foregroundColor(Colors.cellSubTitleText)
            }
            
        }
        
    }
}

struct BurnView_Previews: PreviewProvider {
    static var previews: some View {
        BurnView()
    }
}
