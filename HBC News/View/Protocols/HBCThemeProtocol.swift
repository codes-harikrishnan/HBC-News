//
//  HBCThemeProtocol.swift
//  HBC News
//
//  Created by Harikrishnan on 03/11/2021.
//

import SwiftUI

protocol HBCThemeProtocol {
    func applyTheme()
}

extension HBCThemeProtocol {
    func applyTheme() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = themeColor
        
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
    }
}
