//
//  DetailedView.swift
//  HBC News
//
//  Created by Harikrishnan on 04/11/2021.
//

import SwiftUI

struct DetailedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let story : Article?
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                List {
                    if let thistory = story,let articleDescription =  thistory.articleDescription{
                    TitleNewsCell(story:thistory)
                     Text(articleDescription+"...")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        HStack() {
                             Spacer()
                            
                            Button{
                                
                                if let urlString = story?.url, let url = URL(string:urlString) {
                                    UIApplication.shared.open(url)
                                }
                                
                            } label: {
                                Text("Read More")
                                    .frame(width: 200, height: 50, alignment: .center)
                            }.background(Color(themeColor))
                             .cornerRadius(10)
                             .foregroundColor(Color.white)
                             .padding(.vertical)
                            
                             Spacer()
                        }
                        
                    }
                    
                    
                } .listStyle(PlainListStyle())
                    .listRowInsets(EdgeInsets())
                    .background(Color.white)
                    .navigationBarTitle("")
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
    
    struct DetailedView_Previews: PreviewProvider {
        static var previews: some View {
            DetailedView(story: nil)
        }
    }
