//
//  SpecificProtocol.swift
//  HBC News
//
//  Created by Harikrishnan on 03/11/2021.
//

import Foundation
protocol SpecificProtocol : Hashable{
    var title : String { get set}
    var icon : String? { get set}
    var code : String? { get set}
}

