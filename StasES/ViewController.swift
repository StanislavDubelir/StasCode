//
//  ViewController.swift
//  StasES
//
//  Created by admin on 12.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var aTextField: UITextField!
    
    @IBOutlet private weak var bTextField: UITextField!
    
    @IBOutlet private weak var cTextField: UITextField!
    
    @IBOutlet private weak var root1Label: UILabel!
    
    @IBOutlet private weak var root2Label: UILabel!
    
    @IBOutlet private weak var discResLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnStart() {
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        
        guard let aText = aTextField.text, !aText.isEmpty else {
            showAlert(message: "Fill a index")
            return
        }
        
        guard let bText = bTextField.text, !bText.isEmpty else {
            showAlert(message: "Fill b index")
            return
        }
        
        guard let cText = cTextField.text, !cText.isEmpty else {
            showAlert(message: "Fill c index")
            return
        }
        
        
        guard let a = Double(aText),
              let b = Double(bText),
              let c = Double(cText) else { return }
        
        guard a != .zero else {
            showAlert(message: "a can`t = 0")
            return
        }
        
        let disc = (b * b) - 4 * a * c
        var currentResult: PowResult = .noResults
        
        if disc < .zero {
            root1Label.text = "No roots"
            root2Label.text = "No roots"
            discResLabel.text = "D = \(disc)"
            currentResult = .noResults
        } else if disc == .zero {
            let x = -b / (2 * a)
            root1Label.text = "\(x)"
            root2Label.text = "Just one root"
            discResLabel.text = "D = \(disc)"
            currentResult = .oneResult(result: x)
        } else if disc > .zero {
            let x1 = (-b + sqrt(disc)) / (2 * a)
            let x2 = (-b - sqrt(disc)) / (2 * a)
            root1Label.text = "\(x1)"
            root2Label.text = "\(x2)"
            discResLabel.text = "D = \(disc)"
            currentResult = .twoResults(result1: x1, result2: x2)
        }
        
        let currentDate = Date()
        let resultModel = ResultModel(historyResult: currentResult, date: currentDate)
        
        var historyResult = ResultModel.load()
        historyResult.append(resultModel)
        ResultModel.save(history:historyResult)

//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(resultModel) {
//            UserDefaults.standard.set(encoded, forKey: "SavedResults")
//            print("Save")
//        }
    }
}


//            guard disc >= .zero else {
//                root1Label.text = "No roots"
//                root2Label.text = "No roots"
//                discResLabel.text = "D = \(disc)"
//                return
//            }
//
//            guard disc > .zero || disc < .zero else {
//                let x = -b / (2 * a)
//                root1Label.text = "\(x)"
//                discResLabel.text = "D = \(disc)"
//                return
//            }
//
//            guard disc <= .zero else {
//                let x1 = (-b + sqrt(disc)) / (2 * a)
//                let x2 = (-b - sqrt(disc)) / (2 * a)
//                root1Label.text = "\(x1)"
//                root2Label.text = "\(x2)"
//                discResLabel.text = "D = \(disc)"
//                return
//            }

//        if disc < 0 {
//            root1Label.text = "No roots"
//            root2Label.text = "No roots"
//            discResLabel.text = "D = \(disc)"
//        }
//        else if disc == 0 {
//            let x = -b / (2 * a)
//            root1Label.text = "\(x)"
//            discResLabel.text = "D = \(disc)"
//        }
//        else if disc > 0{
//            let x1 = (-b + sqrt(disc)) / 2 * a
//            let x2 = (-b + sqrt(disc)) / 2 * a
//            root1Label.text = "\(x1)"
//            root2Label.text = "\(x2)"
//            discResLabel.text = "D = \(disc)"
