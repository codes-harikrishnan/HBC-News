//
//  String+Extension.swift
//  HBC News
//
//  Created by Harikrishnan on 01/11/2021.
//

import Foundation
extension String {
    func getDateFromAPI()  -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self) ?? Date()
    }
}
