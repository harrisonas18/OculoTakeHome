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
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
            }
            Text("Select recommendations you'd like to set as a goal")
                .foregroundColor(Colors.subTitleText)
            VStack(alignment: .leading, spacing: 16) {
                Button {
                    vm.cellOneGoal.toggle()
                } label: {
                    if vm.cellOneGoal {
                        GoalCellViewEnabled(cellText: "Spend 30 minutes on activity")
                    } else {
                        GoalCellViewDisabled(cellText: "Spend 30 minutes on activity")
                    }
                    
                }
                Button {
                    vm.cellTwoGoal.toggle()
                } label: {
                    if vm.cellTwoGoal {
                        GoalCellViewEnabled(cellText: "Finish eating 2 hours before bedtime")
                    } else {
                        GoalCellViewDisabled(cellText: "Finish eating 2 hours before bedtime")
                    }
                    
                }
                Button {
                    vm.cellThreeGoal.toggle()
                } label: {
                    if vm.cellThreeGoal {
                        GoalCellViewEnabled(cellText: "Take a cold shower")
                    } else {
                        GoalCellViewDisabled(cellText: "Take a cold shower")
                    }
                    
                }
                Button {
                    vm.cellFourGoal.toggle()
                } label: {
                    if vm.cellFourGoal {
                        GoalCellViewEnabled(cellText: "Sleep 8 hours")
                    } else {
                        GoalCellViewDisabled(cellText: "Sleep 8 hours")
                    }
                    
                }
                Button {
                    vm.cellFiveGoal.toggle()
                } label: {
                    if vm.cellFiveGoal {
                        GoalCellViewEnabled(cellText: "Do morning meditation")
                    } else {
                        GoalCellViewDisabled(cellText: "Do morning meditation")
                    }
                    
                }
            }
            Spacer()
                .frame(height: 30)
            Button {
                dismiss()
            } label: {
                
                if  vm.cellOneGoal ||
                    vm.cellTwoGoal ||
                    vm.cellThreeGoal ||
                    vm.cellFourGoal ||
                    vm.cellFiveGoal
                {
                    Text("ADD")
                        .padding()
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Colors.goalCellBackground)
                        .background(Colors.addGoalsButtonBackgroundEnabled)
                        .cornerRadius(16)
                } else {
                    Text("ADD")
                        .padding()
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Colors.addGoalsButtonText)
                        .background(Colors.addGoalsButtonBackgroundDisabled)
                        .cornerRadius(16)
                        .disabled(true)
                }
                
                
            }
            Spacer()
                .frame(height: 30)
            //Spacer()
        }
        .padding()
        .background(Colors.addGoalsPopoverBackground)
    }
}

struct AddGoalsPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalsPopoverView()
    }
}
