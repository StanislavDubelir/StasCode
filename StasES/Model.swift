//
//  Model.swift
//  StasES
//
//  Created by admin on 31.07.2023.
//

import Foundation

enum PowResult: Codable {
    case oneResult(result: Double)
    case twoResults(result1: Double, result2: Double)
    case noResults
}

struct ResultModel: Codable {
    let historyResult: PowResult
    let date: Date
    let formattedDate: String
    
    init(historyResult: PowResult, date: Date) {
        self.historyResult = historyResult
        self.date = date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.locale = Locale(identifier: "uk_UA")
        formattedDate = dateFormatter.string(from: date)
    }
    
    

    
   static func save(history: [ResultModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(history) {
            UserDefaults.standard.set(encoded, forKey: "SavedResult")
            print("Saved")
        }
    }
    
   static func load() -> [ResultModel] {
        let decoder = JSONDecoder()
        if let savedResults = UserDefaults.standard.data(forKey: "SavedResult"),
           let decoded = try? decoder.decode([ResultModel].self, from: savedResults) {
            print(savedResults)
            return decoded
        }
        return []
    }
    
//    static let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy HH:mm"
//        formatter.locale = Locale(identifier: "uk_UA")
//        return formatter
//    }()
//
//    var formattedDate: String {
//        return ResultModel.dateFormatter.string(from: date)
//    }
}



