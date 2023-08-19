//
//  Model.swift
//  StasES
//
//  Created by admin on 31.07.2023.
//

import Foundation

//enum ResultsModelEnum:String,Codable{
//    case root1
//    case root2
//    case disc
//}
let dateFormatter = DateFormatter()


enum PowResult: Codable {
    case oneResult(result: Double)
    case twoResults(result1: Double, result2: Double)
    case noResults
}

struct ResultModel: Codable{
    static var history: [ResultModel] = []
    let historyResult: PowResult
    let date: Date
    
    static func save(_ results: [PowResult]) {
        let encodedData = results.compactMap { try? JSONEncoder().encode($0)}
        UserDefaults.standard.set(encodedData, forKey: "savedResult")
    }
    
    static func load() -> [ResultModel]{
        guard let encodedData = UserDefaults.standard.array(forKey: "savedResult") as? [Data]
        else {
            return []
        }
        return encodedData.map {try! JSONDecoder().decode(ResultModel.self, from: $0) }
    }
    
}


//func loadUserDefaults(for answers:PowResult ){
//    switch answers{
//    case .oneResult(_):
//        UserDefaults.standard.string(forKey: "root1")
//    case .twoResults(_, _):
//        UserDefaults.standard.string(forKey: "root2")
//    case .noResults:
//        UserDefaults.standard.string(forKey: "disc")
//    }



//    func loadResultfromUserDefaults() -> resultModel?{
//        guard let root1 = userDefaults.string(forKey: "root1"),
//              let root2 = userDefaults.string(forKey: "root2"),
//              let disc = userDefaults.string(forKey: "disc")
//        else {
//            return nil
//        }
//        return resultModel(.root1: root1, .root2: root2, .disc: disc)

