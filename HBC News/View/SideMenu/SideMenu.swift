//
//  SideMenu.swift
//  HBC News
//
//  Created by Harikrishnan on 01/11/2021.
//

import SwiftUI

struct MenuContent: View {
    let categorySelcted: (String) -> Void
    
    var body: some View {
       
        NavigationView{
            List (HBCData.categories, id: \.self) { category in
            ZStack{
                CategoryView(specific:category)
                  
                Button {
                    print("\(category)")
                    categorySelcted(category.title)
                } label: {
                    Text("")
                }
                .contentShape(Rectangle())
            }
            
           
        } .listStyle(PlainListStyle())
            .listRowInsets(EdgeInsets())
            .background(Color(secondThemeColor))
            .navigationBarTitle("Categories")
            .navigationBarTitleDisplayMode(.inline).background(Color.white)
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    let categorySelcted: (String) -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color(secondThemeColor).opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent(categorySelcted: categorySelcted)
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}



