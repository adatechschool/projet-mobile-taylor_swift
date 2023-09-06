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
        QuestionsView()
    }
}

struct FlagsView_Previews: PreviewProvider {
    static var previews: some View {
        FlagsView()
            .environmentObject(Swifties())
    }
}
