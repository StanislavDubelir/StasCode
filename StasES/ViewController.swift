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
              let cText = cTextField.text,
              let a = Double(aText),
              let b = Double(bText),
              let c = Double(cText) else {return}
        
        let disc = (b * b) - 4 * a * c
        
        guard disc >= 0 else {
            root1Label.text = "No roots"
            root2Label.text = "No roots"
            discResLabel.text = "D = \(disc)"
            return
        }
        
        guard disc > 0 || disc < 0 else {
            let x = -b / (2 * a)
            root1Label.text = "\(x)"
            discResLabel.text = "D = \(disc)"
            return
        }
        
        guard disc <= 0 else {
            let x1 = (-b + sqrt(disc)) / (2 * a)
            let x2 = (-b - sqrt(disc)) / (2 * a)
            root1Label.text = "\(x1)"
            root2Label.text = "\(x2)"
            discResLabel.text = "D = \(disc)"
            return
        }
    }
}

        
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
            

