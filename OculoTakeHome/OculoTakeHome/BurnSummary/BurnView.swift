//
//  BurnView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI

struct BurnView: View {
    
    @State var burnRateModel: BurnModel
    @State var animate = false
    
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    .fill(LinearGradient(
                        gradient: .init(colors: [Colors.burnGraphicGradient2, Colors.burnGraphicGradient1]),
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 0.65)
                      ))
                    .blur(radius: 18)
                    .frame(width: 260, height: 260)
                    .scaleEffect(self.animate ? 1 : 1.10)
                    .onAppear { self.animate = true }
                        .animation(animate ? Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true) : .default, value: animate)
                Circle()
                    .strokeBorder(Colors.bgOuterRing, lineWidth: 1.4)
                    .frame(width: 300, height: 300)
                Circle()
                    .strokeBorder(Colors.bgMiddleRing, lineWidth: 1.28)
                    .frame(width: 200, height: 200)
                Circle()
                    .strokeBorder(Colors.bgInnerRing, lineWidth: 1.28)
                    .frame(width: 100, height: 200)
                VStack {
                    Text(burnRateModel.burnRate)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                    Text(burnRateModel.time)
                        .foregroundColor(Colors.cellSubTitleText)
                }
                
            }
        }
        
    }
}

struct BurnView_Previews: PreviewProvider {
    static var previews: some View {
        BurnView(burnRateModel: BurnModel(burnRate: "87", time: "Today, 12:47 PM"))
    }
}
