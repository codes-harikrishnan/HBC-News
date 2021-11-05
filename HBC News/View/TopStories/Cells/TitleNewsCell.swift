//
//  TitleNewsCell.swift
//  HBC News
//
//  Created by Harikrishnan on 01/11/2021.
//

import SwiftUI

struct TitleNewsCell : View {
    
    var story : Article
    var body : some View {
            VStack(alignment: .leading , spacing:10){
              
                if #available(iOS 15.0, *) {
                    AsyncImage(url: URL(string: story.urlToImage ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color(themeColor).opacity(0.1)
                    }
                }
              
                else {
                    HBCImage(url: URL(string: story.urlToImage ?? ""))
                        .scaledToFill()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                }
                
                Text(story.title ?? "")
                .fontWeight(.bold)
                .font(.headline)
                .lineLimit(4)
                .padding(0)

                Text(story.publishedAt?.getDateFromAPI().timeAgoDisplay() ?? "")
                .font(.caption2)
                .fontWeight(.light)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(themeColor))
               
                Spacer()
                .frame(height: 5)
            }.padding(20)
            
           
    }
    
}

