//
//  ViewController.swift
//  CBFramework
//
//  Created by handrata.febrianto on 09/07/2021.
//  Copyright (c) 2021 handrata.febrianto. All rights reserved.
//

import UIKit
//import CBFramework

class ViewController: UIViewController {
    @IBOutlet weak var lblBalance: UILabel!
    
    let pubKey = "pubKey001"
    let partnerPubId = "partner01"
    let userId = "user001"
    
    var cbToken: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        cbToken = CashbacFrameworkSDK.configure(withPubKey: pubKey,
//                                                partnerPubId: partnerPubId,
//                                                userIdentifier: userId)
//        lblBalance.text = "\(CashbacFrameworkSDK.sharedInstance.getBalance().intValue)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    @IBAction func btnPaymentMethodAction() {
        //CashbacFrameworkSDK.sharedInstance.showPaymentMethodList(cbToken, parentViewController: self)
    }
    
    @IBAction func btnPayWithCashbacAction() {
        //CashbacFrameworkSDK.sharedInstance.showPaymentPage(cbToken, parentViewController: self)
    }
    
    @IBAction func btnTransactionHistoryAction() {
        //CashbacFrameworkSDK.sharedInstance.showPaymentHistory(cbToken, parentViewController: self)
    }
}
