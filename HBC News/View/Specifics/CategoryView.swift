//
//  CategoryView.swift
//  HBC News
//
//  Created by Harikrishnan on 03/11/2021.
//

import Foundation
import SwiftUI

struct CategoryView: SpecificViewProtocol {
    var specific: Category
    
    typealias T = Category
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: specific.icon ?? "square")
                Text(specific.title.capitalized).frame( height: 50,alignment: .leading)
                    .font((specific.title == Configuration.shared.category) ? .headline : .subheadline)
            }
        }
    }
}
