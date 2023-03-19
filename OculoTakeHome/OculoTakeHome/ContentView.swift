//
//  ContentView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        VStack {
            Image("OculoIcon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
            Button {
                vm.showBurnSummary = true
            } label: {
                Text("Show Burn Summary")
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            }
            .buttonStyle(.borderedProminent)
            .fullScreenCover(isPresented: $vm.showBurnSummary) {
                BurnSummaryView()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.burnSummaryBackground)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
