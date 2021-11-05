//
//  Settings.swift
//  HBC News
//
//  Created by Harikrishnan on 03/11/2021.
//

import SwiftUI

struct Settings: View,HBCThemeProtocol {
    
    init() {
        applyTheme()
    }
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geo in
                List{
                    NavigationLink(destination: Languages()
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)) {
                    
                    SettingsView(specific: SettingsItem(icon: "abc", code: nil, title: "Language"))
                    }
                    NavigationLink(destination: About()
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)) {
                    SettingsView(specific: SettingsItem(icon: "signature", code: nil, title: "About"))
                    }
                } .listStyle(PlainListStyle())
                    .listRowInsets(EdgeInsets())
                    .background(Color(secondThemeColor))
                    .navigationBarTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline).background(Color.white)
            }
        }
    }
}
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

struct SettingsView: View {
 
    let specific : SettingsItem

    var body: some View {
        ZStack {
            HStack {
                Image(systemName: specific.icon ?? "square")
                    .font(.system(size: 16, weight: .medium))
                Text(specific.title).frame( height: 50,alignment: .leading)
                    .font(.subheadline)
            }
        }
    }
}


