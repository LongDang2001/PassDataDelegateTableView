//
//  FourViewController.swift
//  PasDataDelegate2
//
//  Created by admin on 2/8/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class FourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, passDataDelegateFire {
    var indexPatcha: IndexPath?
    
    func passDataFire(data: String) {
        // arrayName.insert(data, at: arrayName.count)
        arrayName.append(data)
        tableView.reloadData()
    }
    

    @IBOutlet weak var tableView: UITableView!
    var arrayName: [String] = ["mot","hai","ba","bon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.yellow
        tableView.dataSource = self
        tableView.delegate = self

        
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print("sselecrow at")
        return indexPath
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        indexPatcha = indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath)
        
        cell.textLabel?.text = arrayName[indexPath.row]
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passDataToFire = segue.destination as? FireViewController
        if let indexFire = tableView.indexPathForSelectedRow {
            passDataToFire?.dataFire = arrayName[indexFire.row]
            
        }
        passDataToFire?.delegateFire = self // cau lenh nay co tac dung gi
        
        tableView.reloadData()
    }

    
}
