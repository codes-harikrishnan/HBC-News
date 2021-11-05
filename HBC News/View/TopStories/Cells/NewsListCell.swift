//
//  NewsListCell.swift
//  HBC News
//
//  Created by Harikrishnan on 01/11/2021.
//

import SwiftUI

struct NewsListCell : View{
    var story : Article
    var body : some View {
        HStack{
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: story.urlToImage ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100,height: 70)
                } placeholder: {
                    Color(themeColor).opacity(0.1)
                }   .clipped()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 70)
               
                
            } else {
                HBCImage(url: URL(string: story.urlToImage ?? ""))
                    .frame(width: 100,height: 70)
            }

            VStack(alignment: .leading, spacing:10 ) {
                Text(story.title ?? "")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                
                Text(story.publishedAt?.getDateFromAPI().timeAgoDisplay() ?? "")
                    .font(.caption2)
                    .fontWeight(.light)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(themeColor))
        }
        
    }
    
}
}
