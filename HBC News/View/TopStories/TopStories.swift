//
//  TopStories.swift
//  HBC News
//
//  Created by Harikrishnan on 01/11/2021.
//

import Foundation
import SwiftUI

struct TopStories : View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = TopStoriesViewModel()
    //@State var didAppear = false
    @State var menuOpened = false
    @State var navigationTitle = "Top Stories"
    var selectedCountry : Country?
    //var regionSelected : Bool
    
    var body : some View {
        let withIndex = viewModel.topStories.enumerated().map({ $0 })
        ZStack{
           
            NavigationView {
                GeometryReader { geo in
                List(withIndex,id: \.element.url){ index,story in
                  
                    if index == 0, let thisstory = viewModel.topStories.first {
                        NavigationLink(destination: DetailedView(story:thisstory)
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)) {
                            
                        TitleNewsCell(story:thisstory)
                        .frame(width: geo.size.width ,alignment: .leading)
                            .padding(EdgeInsets(top: -10, leading: -20, bottom: 0, trailing: 0))
                            
                        }
                    }
                    
                    else {
                        NavigationLink(destination: DetailedView(story:story)
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)) {
                        
                        NewsListCell(story: story)
                        }
                    }
                }
            }
                .padding(0)
               
                .listStyle(PlainListStyle())
                .listRowInsets(EdgeInsets())
                .navigationBarTitle(navigationTitle)
                .navigationBarTitleDisplayMode(.inline).background(Color.white)
                .navigationBarItems(leading:
                                        Button{
                    if selectedCountry != nil {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    else {
                        self.menuOpened.toggle()
                    }
                  
                } label: {
                    if selectedCountry != nil {
                        Image(systemName: "chevron.backward").foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .medium))
                    } else {
                        Image(systemName: "text.justify").foregroundColor(Color.white)
                    }
                    
                })
                .onAppear(perform: {
                    if Configuration.shared.autoRefreshNews == true {
                    if let selectedCountry = selectedCountry {
                        Configuration.shared.country = selectedCountry.code
                        Configuration.shared.language = nil
                        self.navigationTitle = selectedCountry.title
                    }
                    viewModel.getTopStories()
                }
                    Configuration.shared.autoRefreshNews = false
                    
            })
               
        }
            SideMenu(width: 250, isOpen: self.menuOpened) {
                menuOpened.toggle()
            } categorySelcted: { category in
                Configuration.shared.category = category
                self.navigationTitle = category.capitalized
                viewModel.getTopStories()
            }

        }
        
        
}
}

