//
//  CashbacFrameworkSDK.swift
//  CashbacFramework
//
//  Created by Handrata on 12/08/21.
//

import Foundation
import UIKit

open class CashbacFrameworkSDK: NSObject {
    public static let sharedInstance = CashbacFrameworkSDK()
    
    
    private var pubKey: String = ""
    private var partnerPubId: String = ""
    private var userIdentifier: String = ""
    
    public static func configure(withPubKey pubKey: String, partnerPubId: String, userIdentifier: String) -> String {
        sharedInstance.pubKey = pubKey
        sharedInstance.partnerPubId = partnerPubId
        sharedInstance.userIdentifier = userIdentifier
        
        let token = "token123"
        return token
    }
    
    public func getBalance() -> NSNumber {
        return NSNumber(value: 10000)
    }
    
    public func showPaymentMethodList(token: String, parentViewController vc: UIViewController) {
        let paymentMethodListVC = PaymentMethodListViewController()
        let navController = UINavigationController(rootViewController: paymentMethodListVC)
        vc.present(navController, animated: true, completion: nil)
    }
    
    public func showPaymentPage(token: String, parentViewController vc: UIViewController) {
        let paymentPageVC = PaymentPageViewController()
        let navController = UINavigationController(rootViewController: paymentPageVC)
        vc.present(navController, animated: true, completion: nil)
    }
    
    public func showPaymentHistory(token: String, parentViewController vc: UIViewController) {
        let paymentHistoryVC = PaymentHistoryViewController()
        let navController = UINavigationController(rootViewController: paymentHistoryVC)
        vc.present(navController, animated: true, completion: nil)
    }
}
