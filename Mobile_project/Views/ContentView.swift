//
//  ContentView.swift
//  Mobile_project
//
//  Created by kady on 30/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                Text("Flag Quiz")
                    .lilacTitle()
                
                Text("Are you ready to play ?")
                    .foregroundColor(Color("AccentColor"))
            }
            PrimaryButton(text: "Let's play !")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.98, green: 0.92, blue: 0.84))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
