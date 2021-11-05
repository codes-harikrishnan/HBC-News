//
//  LanguageView.swift
//  HBC News
//
//  Created by Harikrishnan on 03/11/2021.
//

import SwiftUI

struct LanguageView: SpecificViewProtocol {
    var specific: Language
    
    typealias T = Language

    var body: some View {
        ZStack {
            HStack {
                Image(systemName: specific.icon ?? "square")
                Text(specific.title.capitalized).frame( height: 50,alignment: .leading)
                    .font(.subheadline)
            }
        }
    }
}

