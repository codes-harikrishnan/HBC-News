//
//  Configuration.swift
//  HBC News
//
//  Created by Harikrishnan on 31/10/2021.
//

import Foundation

class Configuration {
    let version : String = "1.0.0"
    var country : String? = "us"
    var category : String? = "general"
    var language : String? = "en"
    var speakingLanguage : String? = "en-US"
    
    var autoRefreshNews : Bool = true
    var startBroadCasting : Bool = false
    
    static let shared =  Configuration()
    private init() {
        
    }
}
