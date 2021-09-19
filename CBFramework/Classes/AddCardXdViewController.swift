//
//  AddCardXdViewController.swift
//  Pods
//
//  Created by Handrata on 19/09/21.
//

import UIKit
import Xendit

let xenditPK = "xnd_public_development_OYuGfOVy3bSqx5M/LeUfTj7Eb9D1pdR/wXbm+Rxj9GHU+bKjDwN1gg=="

class AddCardXdViewController: UIViewController {
    var nav: UINavigationController!
    //var delegate: AddCardXenditViewControllerDelegate!
    var name: String!
    var number: String!
    var cvv: String!
    var expDateMonth: String!
    var expDateYear: String!
    var finalTokenId: String!
    var finalAuthId: String!
    var hitOnce: Bool = false
    var parentController: UIViewController!

    func cancel() {
        // btnCancel.removeFromSuperview()
        self.dismiss(animated: false, completion: nil)
        // self.navigationController?.popViewController(animated: false)

        if (hitOnce == false && finalTokenId != nil && finalTokenId.count > 0) {
            hitOnce = true
            self.perform(#selector(callback), with: nil, afterDelay: 1)
        }
    }

    @objc func callback() {
        if (self.number == "4000000000000002") {
            self.number = number.appending("\(arc4random())")
        }
        if let tokenID = finalTokenId,
           let authId = finalAuthId,
           tokenID.count > 0,
           authId.count > 0 {
        }
    }

    func startXendit() {
        Xendit.publishableKey = xenditPK
        let cardData = CardData()
        cardData.cardNumber = number
        cardData.cardExpMonth = expDateMonth
        cardData.cardExpYear = expDateYear
        cardData.cardCvn = cvv
        cardData.amount = 0
        cardData.isMultipleUse = true

        Xendit.createToken(fromViewController: self.parentController, cardData: cardData) { (token, error) in
            let localTokenId = token?.id ?? ""
            let localAuthId = token?.authenticationId ?? ""
            print("xendit token : \(localTokenId)/\(localAuthId)")
            if let error = error {
                // Handle error. Error is of type XenditError
                self.onError(error.message, "request multitoken", error.errorCode, localTokenId, localAuthId)
            } else if let token = token,
                      let status = token.status,
                      status.lowercased() == "VERIFIED".lowercased() {
                print("xendit success \(localTokenId)")
                // need to call 3ds function
                AddCardXdViewController.call3dsWith(isThreshold: false,
                                                    tokenId: localTokenId,
                                                    authId: localAuthId,
                                                    parentController: self.parentController,
                                                    amount: cardData.amount,
                                                    didSuccess: { newToken, newAuthID in
                                                        self.finalTokenId = newToken
                                                        self.finalAuthId = newAuthID
                                                        DispatchQueue.main.async {
                                                            self.cancel()
                                                        }
                                                    }, didError: {error in
                                                        self.onError(error.message, "create authentication", error.errorCode, localTokenId, localAuthId)
                                                    }, didCancel: {
                                                        DispatchQueue.main.async {
                                                            self.cancel()
                                                        }
                                                    })
            }
        }
    }

    func onError(_ message: String, _ reason: String = "unknown", _ errorCode: String, _ tokenId: String, _ authId: String) {
        if number != nil && number.count > 10 {
            let first6 = (number as NSString).substring(to: 6)
            let last4 = (number as NSString).substring(from: number.count - 4)

            // Notes: TO DO - in the future when log xendit can be anonymous, user pub id need to be remove from parameters
            let errorDic: [String: Any] = [
                "action": reason,
                "cardNumber": "\(first6)#\(last4)",
                "messageFromXendit": message,
                "errorCode": errorCode,
                "platform": "iOS"
            ]
            print("error Dic", errorDic)
        }
    }

    static func call3dsWith(isThreshold: Bool, tokenId: String, authId: String, parentController: UIViewController, amount: NSNumber, didSuccess: @escaping (String, String) -> Void, didError: @escaping (XenditError) -> Void, didCancel: @escaping() -> Void) {
//        #if DEBUG
//        didSuccess(tokenId, "test")
//        #else
        Xendit.publishableKey = xenditPK
        Xendit.createAuthentication(fromViewController: parentController, tokenId: tokenId, amount: amount, completion: {(authentication, error) in
            print("xendit token : \(tokenId)/\(authentication?.id ?? "")")
            if let error = error {
                // Handle error. Error is of type XenditError
                didError(error)
            } else {
                // success
                if let authentication = authentication,
                   let status = authentication.status,
                   status.lowercased() == "VERIFIED".lowercased() {
                    // Handle successful authentication
                    print("xendit success aut \(String(describing: authentication.id)))")
                    didSuccess(tokenId, authentication.id)
                } else {
                    print("xendit cancel auth or failed")
                    didCancel()
                }
            }
        })
//        #endif
    }
}
