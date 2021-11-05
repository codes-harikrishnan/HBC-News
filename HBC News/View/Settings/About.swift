//
//  About.swift
//  HBC News
//
//  Created by Harikrishnan on 04/11/2021.
//

import SwiftUI

struct About: View,HBCThemeProtocol {
    @Environment(\.presentationMode) var presentationMode
    init() {
        applyTheme()
    }
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                List{
                     AboutField(title: "Version", urlString:Configuration.shared.version, icon: "v.circle.fill")
                    
                    AboutField(title: "Developed by", urlString:HBCData.Developer.name, icon: "keyboard")
                    
                    AboutField(title: "Email", urlString:HBCData.Developer.mailId, icon: "envelope")
                   
                    AboutField(title: "Blog", urlString:HBCData.Developer.mediumURL, icon: "highlighter")
                    
                    AboutField(title: "GitHub", urlString: HBCData.Developer.gitHubURL, icon: "icloud.and.arrow.up")
                    
                    AboutField(title: "LinkedIn", urlString: HBCData.Developer.linkedInURL, icon: "person.crop.rectangle")
                    
                } .listStyle(PlainListStyle())
                    .listRowInsets(EdgeInsets())
                    .background(Color(secondThemeColor))
                    .navigationBarTitle("About")
                    .navigationBarTitleDisplayMode(.inline).background(Color.white)
                    .navigationBarItems(leading:
                                            Button{
                            self.presentationMode.wrappedValue.dismiss()
                    } label: {
                            Image(systemName: "chevron.backward").foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                        })
            }
            
        }
    }
}

struct AboutField: View {
    let title: String
    let urlString : String
    let icon : String
    var body: some View {
        Button{
            if let url = URL(string:urlString) {
                UIApplication.shared.open(url)
            }
        } label: {
            SettingsView(specific: SettingsItem(icon: icon, code: nil, title: "\(title): \(urlString)"))
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
