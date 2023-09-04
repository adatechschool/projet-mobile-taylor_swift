//
//  ContentView.swift
//  Mobile_project
//
//  Created by kady on 30/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .frame(width: 120, height: 120)
            Text("Flags Quiz")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
