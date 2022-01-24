//
//  KevinHandler.swift
//  Runner
//
//  Created by Daniel Klinge on 20/01/2022.
//

import Flutter
import UIKit
import Kevin

class KevinHandler: KevinAccountLinkingSessionDelegate, KevinPaymentSessionDelegate {
    
    static let shared = KevinHandler()
    
    public var flutterController: FlutterViewController?
    private var flutterResult: FlutterResult?
    
    private init() { }
    
    func handle(
        call: FlutterMethodCall,
        result: @escaping FlutterResult
    ) -> Void {
        guard let args = call.arguments as? [String: Any] else {
            result("iOS could not recognize flutter arguments in method: \(call.method)")
            return
        }
        
        if(call.method == "OpenKevinAccountLinking") {
            openKevinAccountLinking(result: result, state: args["state"] as! String)
        } else if(call.method == "OpenKevinBankPayment") {
            openKevinBankPayment(result: result, id: args["id"] as! String)
        } else if(call.method == "OpenKevinCardPayment") {
            openKevinCardPayment(result: result, id: args["id"] as! String)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    // ------------------------------------------------------------
    // MARK: - SDK action initializers
    // ------------------------------------------------------------
    
    func openKevinAccountLinking(result: @escaping FlutterResult, state: String) {
        flutterResult = result
        
        do {
            KevinAccountLinkingSession.shared.delegate = self
            try KevinAccountLinkingSession.shared.initiateAccountLinking(
                configuration: KevinAccountLinkingSessionConfiguration.Builder(
                    state: state
                )
                    .setPreselectedCountry(.lithuania)
                    .setCountryFilter([.lithuania, .latvia, .estonia])
                    .setSkipBankSelection(false)
                    .build()
            )
        } catch {
            parseError(error)
        }
    }
    
    func openKevinBankPayment(result: @escaping FlutterResult, id: String) {
        flutterResult = result
        
        do {
            KevinPaymentSession.shared.delegate = self
            try KevinPaymentSession.shared.initiatePayment(
                configuration: KevinPaymentSessionConfiguration.Builder(
                    paymentId: id
                )
                .setPreselectedCountry(.lithuania)
                .setSkipBankSelection(false)
                .build()
            )
        } catch {
            parseError(error)
        }
    }

    func openKevinCardPayment(result: @escaping FlutterResult, id: String) {
        flutterResult = result
        
        do {
            KevinPaymentSession.shared.delegate = self
            try KevinPaymentSession.shared.initiatePayment(
                configuration: KevinPaymentSessionConfiguration.Builder(
                    paymentId: id
                )
                .setPaymentType(.card)
                .build()
            )
        } catch {
            parseError(error)
        }
    }

    // ------------------------------------------------------------
    // MARK: - KevinAccountLinkingSessionDelegate
    // ------------------------------------------------------------
    
    func onKevinAccountLinkingStarted(controller: UINavigationController) {
        flutterController?.present(controller, animated: true, completion: nil)
    }
    
    func onKevinAccountLinkingCanceled(error: Error?) {
        parseError(error)
    }
    
    func onKevinAccountLinkingSucceeded(authorizationCode: String, bank: ApiBank) {
        let response : [String : Any] = [
            "isSuccess": true,
            "authorizationCode": authorizationCode,
            "bank": [
                "id": bank.id,
                "name": bank.name,
                "officialName": bank.officialName ?? "",
                "countryCode": bank.countryCode,
                "isSandbox": bank.isSandbox,
                "imageUri": bank.imageUri,
                "bic": bank.bic ?? "",
                "isBeta": bank.isBeta
            ]
        ]
        
        flutterResult?(response)
        flutterResult = nil
    }
    
    // ------------------------------------------------------------
    // MARK: - KevinPaymentSessionDelegate
    // ------------------------------------------------------------
    
    func onKevinPaymentInitiationStarted(controller: UINavigationController) {
        flutterController?.present(controller, animated: true, completion: nil)
    }
    
    func onKevinPaymentCanceled(error: Error?) {
        parseError(error)
    }
    
    func onKevinPaymentSucceeded(paymentId: String) {
        let response : [String : Any] = [
            "isSuccess": true,
            "paymentId": paymentId,
        ]
        
        flutterResult?(response)
        flutterResult = nil
    }
    
    // ------------------------------------------------------------
    // MARK: - Internal
    // ------------------------------------------------------------
    
    func parseError(_ error: Error?) {
        var response : [String : Any] = [
            "isSuccess": false
        ]

        if let error = error as? KevinError {
            response["error"] = error.description
        } else {
            response["error"] = error?.localizedDescription
        }
        
        flutterResult?(response)
        flutterResult = nil
    }
}
