//
//  HistoryViewController.swift
//  StasES
//
//  Created by admin on 01.08.2023.
//

import UIKit

final class HistoryViewController: UIViewController{
    
    
    @IBOutlet private weak var historyTableView: UITableView!
    
    let identifier = "historyCell"
    let currentDate = Date()
    var arrayModel = [ResultModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedResults = UserDefaults.standard.object(forKey: "SavedResults") as? Data {
            let decoder = JSONDecoder()
            if let loadedresults = try? decoder.decode(ResultModel.self, from: savedResults){
                arrayModel.append(loadedresults)
                historyTableView?.reloadData()
                print(loadedresults)
            }
        }
    }
}
    extension HistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let resultModel = arrayModel[indexPath.row]
        
        return cell
    }
}
 
//
//            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//                return 80
//            }
//}



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
