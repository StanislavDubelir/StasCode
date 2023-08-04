//
//  HistoryViewController.swift
//  StasES
//
//  Created by admin on 01.08.2023.
//

import UIKit

class HistoryViewController: UIViewController{
    
    
    @IBOutlet weak var historyTableView: UITableView!
    
    let identifier = "historyCell"

    var arrayModel = [resultModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    }

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let model = arrayModel[indexPath.row]
        
        cell.textLabel?.text = model
        return cell
    }
    
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 80
            }
}

    
    
//}




//    var myTableView = UITableView()
//    let identifire = "MyCell"
//    var myArray = ["1", "2","3", "4", "5"]

//        createTable()


//func createTable(){
//        self.myTableView = UITableView(frame: view.bounds, style: .plain)
//        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
//
//        self.myTableView.delegate = self
//        self.myTableView.dataSource = self
//
//        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        view.addSubview(myTableView)
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myArray.count
//    }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
//            let number = myArray[indexPath.row]
//            cell.textLabel?.text = number
//
//            return cell
//        }
//
//
//
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 40
//        }
