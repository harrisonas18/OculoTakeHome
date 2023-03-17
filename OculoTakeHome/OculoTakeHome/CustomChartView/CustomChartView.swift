//
//  CustomChartView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI

struct CustomChartView: View {
    
    var times = ["12 AM","","","","","05 AM"]
    var sleepIntervals = [
        [0045,0215],
        [0222,0242],
        [0247,0303],
        [0310,0320],
        [0330,0340] ,
        [0350,0430]
    ]
    
    
    var body: some View {
        
        
        
        VStack{
            
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                HStack {
                    Spacer()
                    ForEach(0..<times.count, id: \.self) { time in
                        Rectangle()
                            .frame(maxWidth: 1, maxHeight: 12)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            HStack (spacing: 10){
                Spacer()
                ForEach(0..<times.count, id: \.self) { time in
                    if time == 0 || time == times.count - 1 {
                        Text(times[time])
                            .font(.system(size: 12))
                        Spacer()
                    } else {
                        Text("")
                            .font(.system(size: 12))
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        
        
    }
}

struct CustomChartView_Previews: PreviewProvider {
    static var previews: some View {
        CustomChartView()
    }
}
