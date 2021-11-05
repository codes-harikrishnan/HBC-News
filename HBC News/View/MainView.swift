//
//  ContentView.swift
//  HBC News
//
//  Created by Harikrishnan on 30/10/2021.
//

import SwiftUI


let coloredNavAppearance = UINavigationBarAppearance()
let themeColor = UIColor(red: 181/255, green: 44/255, blue: 35/255, alpha: 1)

let bgColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)

let secondThemeColor = UIColor(red: 195/255, green: 182/255, blue: 176/255, alpha: 1)

private var colors: [Color] = [.yellow, .purple, .green]

private var gridItemLayout = [GridItem(.adaptive(minimum: 180, maximum: 180)),GridItem(.adaptive(minimum: 180, maximum: 180))]

struct MainView: View,HBCThemeProtocol {
    @State var menuOpen: Bool = true
  
    func openMenu() {
           self.menuOpen.toggle()
      }
    
    init() {
        applyTheme()

        }
    
    var items: [GridItem] {
      Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }
    @State var selectedView = 1
    var body: some View {
       

                
                TabView {
                    
                    TopStories(selectedCountry: nil)
                        .tabItem {
                            Image(systemName: "newspaper.fill")
                            Text("Top Stories")
                        }
                    
                    Radio()
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "radio.fill")
                            Text("Radio")
                        }
                    
                  
                   Region()
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "globe.europe.africa.fill")
                            Text("Countries")
                        }
                 
                   Settings()
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                }.accentColor(Color(themeColor))
//            }
//          //  } }
//        }
        
     }
    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
