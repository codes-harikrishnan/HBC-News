//
//  Radio.swift
//  HBC News
//
//  Created by Harikrishnan on 04/11/2021.
//

import SwiftUI
import AVKit
struct Radio: View,HBCThemeProtocol {
    @State var category : Category = HBCData.categories.filter{$0.title == Configuration.shared.category}.first ?? Category(title: "Unknown")
    @State var language : Language = HBCData.languages.filter{$0.code == Configuration.shared.language}.first ?? Language(title: "Unknown")
   
    @ObservedObject var viewModel = TopStoriesViewModel()
    @ObservedObject var speaker: Speaker = Speaker()
    
    var body: some View {

        NavigationView {
            GeometryReader { geo in
               
                VStack {
                    List {
                        RadioDisplayView(channel: language, programme: category, changeChannel: { index in
                            speaker.synth.stopSpeaking(at: .immediate)
                            language = HBCData.languages[index]
                            Configuration.shared.language = language.code
                            Configuration.shared.speakingLanguage = language.speakCode
                            Configuration.shared.country = nil
                            viewModel.getTopStories(){
                                startBroadcasting(index: 0)
                            }
                            
                        }, changeProgramme: { index in
                            category = HBCData.categories[index]
                            viewModel.getTopStories(){
                                startBroadcasting(index: 0)
                            }
                        })
                        
                    }
  
                       
                        .navigationBarTitle("Radio")
                        .navigationBarTitleDisplayMode(.inline).background(Color.white)
                        .onAppear(perform: {
                            UITableView.appearance().separatorStyle = .none
                            viewModel.getTopStories {
                                Configuration.shared.startBroadCasting = true
                                
                                startBroadcasting(index: 0)

                            }
                           
                            
                        })
                        .background(Color(secondThemeColor))
                        .onDisappear {
                            speaker.synth.stopSpeaking(at: .immediate)
                            Configuration.shared.startBroadCasting  = false
                        }
                    
                   
                }
               

            }
        }
            
    }
        
    
    func startBroadcasting(index: Int) {
       
        if  Configuration.shared.startBroadCasting == false {
            return
        }
        
        if  index >= viewModel.topStories.count { return }
        
        guard let news = viewModel.topStories[index].articleDescription else { return}
        
        speaker.speak(words:news, completed: {
          startBroadcasting(index: index + 1)
        })

    }
    
}



struct Radio_Previews: PreviewProvider {
    static var previews: some View {
        Radio()
    }
}


struct RadioDisplayView: View {
   @State var channel : Language
    @State var programme : Category
    let changeChannel: (Int) -> Void
    let changeProgramme: (Int) -> Void
   
    
    @State private var currentChannel = 0
    @State private var currentProgramme = 0
    var body: some View {
        HStack {
                Spacer()
        VStack {
            Text(channel.title)
                .fontWeight(.medium)
                .font(.system(size: 32, weight: .thin))
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(0)
                .multilineTextAlignment(.center)
            
            
            ZStack {
                Circle()
                    .fill(Color(themeColor))
                    .frame(width: 200, height: 200)
                Image(systemName:"waveform")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.clear)
                    .clipShape(Circle())
                    .frame( height: 100)
                    
                    
            }
            
            Text("Top headlines")
                .fontWeight(.medium)
                .font(.system(size: 26, weight: .thin))
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(.vertical)
            
            Text("Language")
                .fontWeight(.medium)
                .font(.system(size: 12, weight: .thin))
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(.vertical)
            
            Picker("", selection: $currentChannel) {
                ForEach(0..<HBCData.languages.count) {i in
                    Text(HBCData.languages[i].code ?? "").tag(i)
                }
            }
            .onChange(of: currentChannel) { tag in
                channel = HBCData.languages[tag]
                print("Channel: \(tag)")
                changeChannel(tag)
                
            }
            .pickerStyle(.segmented)
            .padding(0)
            
        }
            Spacer()
        }
    }
}
