//
//  Region.swift
//  HBC News
//
//  Created by Harikrishnan on 03/11/2021.
//

import SwiftUI

struct Region: View,HBCThemeProtocol {
    init() {
        Configuration.shared.autoRefreshNews = true
       applyTheme()
        }
    @State private var isActive = false
    var body: some View {
        
        NavigationView {
            GeometryReader { geo in
                
                List (HBCData.countries, id: \.self) { country in
                    
                ZStack{
                    NavigationLink(destination: TopStories(selectedCountry: country)
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)) {
                        CountryView(specific:country)
                    }
                }
                
               
            } .listStyle(PlainListStyle())
                .listRowInsets(EdgeInsets())
                .background(Color(secondThemeColor))
                .navigationBarTitle("Countries")
                .navigationBarTitleDisplayMode(.inline).background(Color.white)
                .onAppear(perform: {
                   Configuration.shared.autoRefreshNews = true
                })
            }
        }
    }
}

struct Region_Previews: PreviewProvider {
    static var previews: some View {
        Region()
    }
}

