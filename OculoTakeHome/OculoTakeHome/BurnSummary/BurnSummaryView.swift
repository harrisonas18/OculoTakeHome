//
//  BurnSummaryView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI

struct BurnSummaryView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = BurnSummaryViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    HStack {
                        Text("BURN SUMMARY")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                        
                    }
                    HStack {
                        Spacer()
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        }
                    }
                }
                BurnView()
                HStack {
                    Text("FACTORS")
                        .foregroundColor(Colors.cellSubTitleText)
                        .fontWeight(.bold)
                    Spacer()
                }
                SleepChartView()
                ActivityChartView()
                CaffeineChartView()
                Button {
                    vm.showAddGoalsPopover = true
                } label: {
                    AddGoalsButtonView()
                }
                .popover(isPresented: $vm.showAddGoalsPopover) {
                    AddGoalsPopoverView()
                        .background(Colors.clearColor)
                }
            }
            .padding()
        }
        .background(Color("BurnSummaryBackground"))
    }
}

struct BurnSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        BurnSummaryView()
    }
}
