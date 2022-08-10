//
//  ContentView.swift
//  MyPersonalManager
//
//  Created by tiago.pereira on 9/8/22.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    NavigationLink( "Finance",
                                    destination: FinanceView()
                    )
                    NavigationLink( "Alimentation",
                                    destination: AlimentationView()
                    )
                    NavigationLink( "Calendar",
                                    destination: CalendarView()
                    )
                }
            }
            .navigationTitle("Dashboard")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
