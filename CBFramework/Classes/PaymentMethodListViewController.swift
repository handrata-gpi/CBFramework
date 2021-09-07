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
        let vc = UIViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
