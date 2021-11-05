//
//  HBCData.swift
//  HBC News
//
//  Created by Harikrishnan on 03/11/2021.
// 


import Foundation


struct HBCData {
    
    static let categories : [Category] = [
    Category(title:"business" , icon: "dollarsign.square.fill"),
    Category(title:"entertainment" , icon: "play.rectangle.fill"),
    Category(title:"general" , icon: "globe.europe.africa"),
    Category(title:"health" , icon: "heart.fill"),
    Category(title:"science" , icon: "network.badge.shield.half.filled"),
    Category(title:"sports" , icon: "figure.walk"),
    Category(title:"technology" , icon: "externaldrive.connected.to.line.below.fill")
    ]

    static let countries : [Country] = [
        Country(title: "UNITED KINGDOM", icon: nil, code: "gb"),
        Country(title: "UNITED ARAB EMIRATES", icon: nil, code: "ae"),
        Country(title: "UNITED STATES OF AMERICA", icon: nil, code: "us"),
        Country(title: "INDIA", icon: nil, code: "in"),
        Country(title: "AUSTRIA", icon: nil, code: "at"),
        Country(title: "AUSTRALIA", icon: nil, code: "au"),
        Country(title: "BELGIUM", icon: nil, code: "be"),
        Country(title: "BULGARIA", icon: nil, code: "bg"),
        Country(title: "BRAZIL", icon: nil, code: "br"),
        Country(title: "CANADA", icon: nil, code: "ca"),
        Country(title: "CHINA", icon: nil, code: "cn"),
        Country(title: "COLOMBIA", icon: nil, code: "co"),
        Country(title: "CZECH REPUBLIC", icon: nil, code: "cz"),
        Country(title: "GERMANY", icon: nil, code: "de"),
        Country(title: "EGYPT", icon: nil, code: "eg"),
        Country(title: "FRANCE", icon: nil, code: "fr"),
        Country(title: "GREECE", icon: nil, code: "gr"),
        Country(title: "HONG KONG", icon: nil, code: "hk"),
        Country(title: "HUNGARY", icon: nil, code: "hu"),
        Country(title: "INDONESIA", icon: nil, code: "id"),
        Country(title: "IRELAND", icon: nil, code: "ie"),
        Country(title: "ISRAEL", icon: nil, code: "il"),
        Country(title: "ITALY", icon: nil, code: "it"),
        Country(title: "JAPAN", icon: nil, code: "jp"),
        Country(title: "REPUBLIC OF KOREA", icon: nil, code: "kr"),
        Country(title: "LITHUANIA", icon: nil, code: "lt"),
        Country(title: "LATVIA", icon: nil, code: "lv"),
        Country(title: "MEXICO", icon: nil, code: "mx"),
        Country(title: "MALAYSIA", icon: nil, code: "my"),
        Country(title: "NETHERLANDS", icon: nil, code: "nl"),
        Country(title: "NORWAY", icon: nil, code: "no"),
        Country(title: "NEW ZEALAND", icon: nil, code: "nz"),
        Country(title: "PHILIPPINES", icon: nil, code: "ph"),
        Country(title: "POLAND", icon: nil, code: "pl"),
        Country(title: "PORTUGAL", icon: nil, code: "pt"),
        Country(title: "ROMANIA", icon: nil, code: "ro"),
        Country(title: "RUSSIAN FEDERATION", icon: nil, code: "ru"),
        Country(title: "SINGAPORE", icon: nil, code: "sg"),
        Country(title: "UKRAINE", icon: nil, code: "ua")
    ]
    static let languages : [Language] = [
    Language(title: "English", icon: nil, code: "en",speakCode: "en-US",speaker: ""),
    Language(title: "Deutsch", icon: nil, code: "de",speakCode: "de-DE",speaker: ""),
    Language(title: "Français", icon: nil, code: "fr",speakCode: "fr-FR",speaker: ""),
    Language(title: "Español", icon: nil, code: "es",speakCode: "es-ES",speaker: ""),
    Language(title: "Português", icon: nil, code: "pt",speakCode: "pt-PT",speaker: ""),
    Language(title: "Nederlands", icon: nil, code: "nl",speakCode: "nl-NL",speaker: ""),
    Language(title: "עִברִית", icon: nil, code: "he",speakCode: "he-IL",speaker: ""),
    Language(title: "Pусский", icon: nil, code: "ru",speakCode: "ru-RU",speaker: ""),
    Language(title: "Italiano", icon: nil, code: "it",speakCode: "it-IT",speaker: ""),
    Language(title: "Norsk", icon: nil, code: "no",speakCode: "no-NO",speaker: ""),
    Language(title: "عربي", icon: nil, code: "ar",speakCode: "ar-SA",speaker: ""),
    Language(title: "中国人", icon: nil, code: "zh",speakCode: "zh-TW",speaker: "")
    ]
    
    struct Developer {
        static let gitHubURL = "https://github.com/codes-harikrishnan"
        static let linkedInURL = "https://www.linkedin.com/in/hari-krishnan-s-29aa83108"
        static let mediumURL = "https://medium.com/@codes-harikrishnan"
        static let mailId = "mails.harikrishnan@gmail.com"
        static let name = "Harikrishnan S"
        
    }
    
    
    
}
