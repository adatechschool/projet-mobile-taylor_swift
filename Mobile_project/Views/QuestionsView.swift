//
//  QuestionsView.swift
//  Mobile_project
//
//  Created by kady on 05/09/2023.
//

import SwiftUI

struct QuestionsView: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Flag Quiz")
                    .lilacTitle()
                
                Spacer()
                
                Text("1 out 10")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: 40)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Question 1")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.98, green: 0.92, blue: 0.84))
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}
