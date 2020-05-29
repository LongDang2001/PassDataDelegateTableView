//
//  FireViewController.swift
//  PasDataDelegate2
//
//  Created by admin on 2/8/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit
protocol passDataDelegateFire {
    func passDataFire(data: String)
}

class FireViewController: UIViewController {

    @IBOutlet weak var textFieldFire: UITextField!
    var dataFire: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataFire != nil {
            textFieldFire.text = dataFire
        }
    }
    
    var delegateFire: passDataDelegateFire?
    @IBAction func backToFire() {
        
        self.delegateFire?.passDataFire(data: textFieldFire.text!)
        dismiss(animated: true, completion: nil)
    }
    

    

}
