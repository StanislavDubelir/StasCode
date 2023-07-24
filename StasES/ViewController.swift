//
//  ViewController.swift
//  StasES
//
//  Created by admin on 12.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var aTextField: UITextField!
    
    @IBOutlet weak var bTextField: UITextField!
    
    @IBOutlet weak var cTextField: UITextField!
    
    @IBOutlet weak var root1Label: UILabel!
    
    @IBOutlet weak var root2Label: UILabel!
    
    @IBOutlet weak var discResLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnStart() {
        guard let aText = aTextField.text,
              let bText = bTextField.text,
              let cText = cTextField.text
        else {return
        }
        
        func showalert (message: String) {
            let textIsEmptyAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            textIsEmptyAlert.addAction(okAction)
            self.present(textIsEmptyAlert, animated: true)
        }
        
        guard !aText.isEmpty else {
            showalert(message: "Fill a index")
            return
        }
        
        guard !bText.isEmpty else {
            showalert(message: "Fill b index")
            return
        }
        
        guard !cText.isEmpty else {
            showalert(message: "Fill c index")
            return
        }
        
        
        guard let a = Double(aText),
              let b = Double(bText),
              let c = Double(cText) else {return}
        
        guard a != .zero else {
            showalert(message: "a can`t = 0")
            return
        }
        
        let disc = (b * b) - 4 * a * c
        
        enum Results{
            case noRoots
            case oneRoot
            case twoRoots
        }
        
        func calculate(for answers: Results){
            switch answers{
                
            case .noRoots:
                root1Label.text = "No roots"
                root2Label.text = "No roots"
                discResLabel.text = "D = \(disc)"
            case .oneRoot:
                let x = -b / (2 * a)
                root1Label.text = "\(x)"
                root2Label.text = "Just one root"
                discResLabel.text = "D = \(disc)"
            case .twoRoots:
                let x1 = (-b + sqrt(disc)) / (2 * a)
                let x2 = (-b - sqrt(disc)) / (2 * a)
                root1Label.text = "\(x1)"
                root2Label.text = "\(x2)"
                discResLabel.text = "D = \(disc)"
            }
        }
        guard disc >= .zero else {
            calculate(for: .noRoots)
            return
        }
        guard disc > .zero || disc < .zero else {
            calculate(for: .oneRoot)
            return
        }
        guard disc <= .zero else{
            calculate(for: .twoRoots)
            return
        }
        
        
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
    
    

