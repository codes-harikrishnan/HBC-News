//
//  CountryView.swift
//  HBC News
//
//  Created by Harikrishnan on 03/11/2021.
//

import SwiftUI

struct CountryView: SpecificViewProtocol {
    var specific: Country
    
    typealias T = Country

    var body: some View {
        ZStack {
            HStack {
                //Image(systemName: specific.icon ?? "square")
                Text(specific.title).frame( height: 50,alignment: .leading)
                    .font(.subheadline)
            }
        }
    }
}
