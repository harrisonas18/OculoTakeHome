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
            Button {
                vm.showBurnSummary = true
            } label: {
                Text("Show Burn Summary")
            }
            .fullScreenCover(isPresented: $vm.showBurnSummary) {
                BurnSummaryView()
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
