//
//  Languages.swift
//  HBC News
//
//  Created by Harikrishnan on 04/11/2021.
//

import SwiftUI

struct Languages: View,HBCThemeProtocol {
    @Environment(\.presentationMode) var presentationMode
    init() {
        applyTheme()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                List (HBCData.languages, id: \.self) { language in
                    LanguagesView(specific:language)
                } .listStyle(PlainListStyle())
                    .listRowInsets(EdgeInsets())
                    .background(Color(secondThemeColor))
                    .navigationBarTitle("Select Language")
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


struct Languages_Previews: PreviewProvider {
    static var previews: some View {
        Languages()
    }
}
struct LanguagesView: View {
 
    let specific : Language

    var body: some View {
        ZStack {
            HStack {
                Text(specific.title).frame( height: 50,alignment: .leading)
                    .font(.subheadline)
            }
            Button {
                if let code = specific.code {
                    Configuration.shared.language = code
                    Configuration.shared.country = nil
                    Configuration.shared.autoRefreshNews = true
                }
                
            } label: {
                
            }
        }
    }
}
