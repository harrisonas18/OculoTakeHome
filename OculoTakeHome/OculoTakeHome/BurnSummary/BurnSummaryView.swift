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
                            Image("closeIcon")
                                .foregroundColor(.white)
                        }
                    }
                }
                BurnView(burnRateModel: vm.burnModel)
                HStack {
                    Text("FACTORS")
                        .foregroundColor(Colors.cellSubTitleText)
                        .fontWeight(.bold)
                    Spacer()
                }
                ForEach(vm.categories, id: \.self) { category in
                    CategoryChartView(category: category)
                }
                Button {
                    vm.showAddGoalsPopover = true
                } label: {
                    AddGoalsButtonView()
                }
                .popover(isPresented: $vm.showAddGoalsPopover) {
                    AddGoalsPopoverView()
                }
            }
            .padding()
        }
        .background(Colors.burnSummaryBackground)
    }
}

struct BurnSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        BurnSummaryView()
    }
}
