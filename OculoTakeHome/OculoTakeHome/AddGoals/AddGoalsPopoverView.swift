//
//  AddGoalsPopoverView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI

struct AddGoalsPopoverView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = AddGoalsPopoverViewModel()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16){
                HStack {
                    Text("Add Goals")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image("closeIcon")
                            .foregroundColor(.white)
                    }
                }
                Text("Select recommendations you'd like to set as a goal")
                    .foregroundColor(Colors.subTitleText)
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(0..<vm.goals.count, id: \.self) { i in
                        Button {
                            vm.goals[i].isSelected.toggle()
                        } label: {
                            if vm.goals[i].isSelected {
                                GoalCellViewEnabled(cellText: vm.goals[i].title)
                            } else {
                                GoalCellViewDisabled(cellText: vm.goals[i].title)
                            }
                        }
                    }
                }
                Spacer()
                    .frame(height: 30)
                Button {
                    if  vm.goals.contains(where: { $0.isSelected }) {
                        //TODO: This is where save goals function would be called
                        dismiss()
                    }
                } label: {
                    if  vm.goals.contains(where: { $0.isSelected }) {
                        AddButtonViewEnabled()
                    } else {
                        AddButtonViewDisabled()
                    }
                }
                .disabled(!vm.goals.contains(where: { $0.isSelected }))
                Spacer()
                    .frame(height: 30)
                Spacer()
            }
            .padding()
            .background(Colors.addGoalsPopoverBackground)
        }
        .background(.clear)
    }
}

struct AddGoalsPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalsPopoverView()
    }
}
