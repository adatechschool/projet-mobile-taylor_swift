//
//  Extensions.swift
//  Mobile_project
//
//  Created by kady on 05/09/2023.
//

import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
