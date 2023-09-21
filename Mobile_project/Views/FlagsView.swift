//
//  FlagsView.swift
//  Mobile_project
//
//  Created by kady on 05/09/2023.
//

import SwiftUI

struct FlagsView: View {
    @EnvironmentObject var swifties: Swifties
    var body: some View {
        if swifties.reachedEnd {
            VStack(spacing: 20) {
                Text("Flag Quiz")
                    .lilacTitle()
                
                Text("Congrats, you completed the game!")
                
                //Text("You scored \(swifties.score) out of \(swifties.length)")
                Text("You scored \(swifties.score) out of 10")

                Button {
                    Task.init {
                        await swifties.fetchAPI()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.98, green: 0.92, blue: 0.84))
        } else {
            QuestionsView()
                .environmentObject(swifties)
        }
        
    }
}

struct FlagsView_Previews: PreviewProvider {
    static var previews: some View {
        FlagsView()
            .environmentObject(Swifties())
    }
}
