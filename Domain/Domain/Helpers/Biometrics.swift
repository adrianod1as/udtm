//
//  Biometrics.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import LocalAuthentication

public class Biometrics: NSObject {

    public static let shared = Biometrics()

    public func canAuthenticate() -> Bool {

        var isBiometricAuthenticationAvailable = false
        var error: NSError?

        if LAContext().canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            isBiometricAuthenticationAvailable = (error == nil)
        }
        return isBiometricAuthenticationAvailable
    }

    public func faceIDAvailable() -> Bool {
        if #available(iOS 11.0, *) {
            let context = LAContext()
            return (context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) && context.biometryType == .faceID)
        }
        return false
    }

    public func touchIDAvailable() -> Bool {
        let context = LAContext()
        var error: NSError?

        let canEvaluate = context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error)
        if #available(iOS 11.0, *) {
            return canEvaluate && context.biometryType == .touchID
        }
        return canEvaluate
    }

    public func reason() -> String {
        return  "Use \(faceIDAvailable() ? "Face ID" : "sua digital") para se autenticar."
    }
}
