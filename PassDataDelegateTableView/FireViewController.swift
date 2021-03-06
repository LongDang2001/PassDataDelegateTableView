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
    var dataFire: String?  // check xem du lieu nhap vao co dung khong
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataFire != nil {
            textFieldFire.text = dataFire
        }
    }
    
    var delegateFire: passDataDelegateFire?  // khai bao mot delegate
    @IBAction func backToFire() {
        
        delegateFire?.passDataFire(data: textFieldFire.text!)
        print("Truyen gia tri: \(textFieldFire.text) ")
        
        dismiss(animated: true, completion: nil)
    }
    
}
