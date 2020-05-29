//
//  FourViewController.swift
//  PasDataDelegate2
//
//  Created by admin on 2/8/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class FourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, passDataDelegateFire {
   
    
    // có mấy dòng code phía dưới mà tìm mãi mới thấy được cách làm
    // ham pass data ve cua delegate
    // cái hàm dưới này là hàm để thêm cái dữ liệu của delegate
    
    func passDataFire(data: String) {
        if let indexFire = tableView.indexPathForSelectedRow {
            self.arrayName[indexFire.row] = data
            tableView.reloadRows(at: [indexFire], with: .none)
            
        } else {
            arrayName.insert(data, at: 0 )
            tableView.reloadData()
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    var arrayName: [String] = ["mot","hai","ba","bon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath)
        cell.textLabel?.text = arrayName[indexPath.row]
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passDataToFire = segue.destination as? FireViewController
        if let indexFire = tableView.indexPathForSelectedRow {
            passDataToFire?.dataFire = arrayName[indexFire.row]
            
        }
        passDataToFire?.delegateFire = self
        
        tableView.reloadData()
    }

    
}
