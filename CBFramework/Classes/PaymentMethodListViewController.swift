//
//  PaymentMethodListViewController.swift
//  CashbacFramework
//
//  Created by Handrata on 12/08/21.
//

import UIKit

class PaymentMethodListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: - Button Action
extension PaymentMethodListViewController {
    @IBAction func btnCloseAction() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func btnLinkCardAction() {
        if let bundle = Bundle(identifier: "org.cocoapods.CBFramework") {
            let vc = AddCardXdViewController(nibName: "AddCardXenditViewController", bundle: nil)
            vc.parentController = self
            vc.name = "USER"
            vc.number = "4000000000000002"
            vc.cvv = "123"
            vc.expDateMonth = "12"
            vc.expDateYear = "2030"
            vc.startXendit()
        }
    }
}
