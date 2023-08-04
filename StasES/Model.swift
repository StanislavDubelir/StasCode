//
//  Model.swift
//  StasES
//
//  Created by admin on 31.07.2023.
//

import Foundation

enum ResultsModelEnum:String,Codable{
    case root1
    case root2
    case disc
}

struct resultModel:Codable{
    var Results: [ResultsModelEnum]
}

let userDefaults = UserDefaults.standard

func loadUserDefaults(for answers:ResultsModelEnum ){
    switch answers{
    case .root1:
        userDefaults.string(forKey: "root1")
    case .root2:
        userDefaults.string(forKey: "root2")
    case .disc:
        userDefaults.string(forKey: "disc")
    }
    
    
    
//    func loadResultfromUserDefaults() -> resultModel?{
//        guard let root1 = userDefaults.string(forKey: "root1"),
//              let root2 = userDefaults.string(forKey: "root2"),
//              let disc = userDefaults.string(forKey: "disc")
//        else {
//            return nil
//        }
//        return resultModel(.root1: root1, .root2: root2, .disc: disc)
    }
