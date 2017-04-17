//
//  ViewController.swift
//  RocUsuallySwift
//
//  Created by pxl on 2016/12/15.
//  Copyright © 2016年 pxl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    fileprivate let tableArrayData = ["RxSwiftDemo_Login", "ChartsDemo","Boxue"]
    fileprivate let tableArrayPushData = ["RXSwiftLoginController", "PXLChartsViewController","BoxueViewController"]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HOME"
        
        listTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell1")
    }
    
    
    
    
    
}


extension ViewController :UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArrayData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 2 || section == 5 {
//            return 15
//        }
//        return 0
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "Cell1"
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as UITableViewCell
        
        cell.backgroundColor = UIColor.white
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.textColor = UIColor(r: 93, g: 93, b: 93)
        
        cell.textLabel?.backgroundColor = UIColor.clear
        
        
        cell.textLabel?.text = self.tableArrayData[indexPath.row] as String
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = swiftClassFromString(className: tableArrayPushData[indexPath.row])
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }

}
