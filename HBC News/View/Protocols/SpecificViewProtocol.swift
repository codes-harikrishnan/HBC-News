//
//  SpecificViewProtocol.swift
//  HBC News
//
//  Created by Harikrishnan on 03/11/2021.
//

import Foundation
import SwiftUI

protocol SpecificViewProtocol : View {
    associatedtype T
    
    var specific : T { get set}
    
}
