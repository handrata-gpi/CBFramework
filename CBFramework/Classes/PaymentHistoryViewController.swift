//
//  PaymentHistoryViewController.swift
//  CashbacFramework
//
//  Created by Handrata on 13/08/21.
//

import UIKit

class PaymentHistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: - Button Action
extension PaymentHistoryViewController {
    @IBAction func btnCloseAction() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
