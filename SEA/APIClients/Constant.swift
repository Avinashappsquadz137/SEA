//
//  Constant.swift
//  Binko Movi
//
//  Created by Warln on 20/08/22.


import UIKit

class ApiRequest {
    static let shared = ApiRequest()
    
    enum BuildType {
        case dev
        case pro
    }
    
    struct Url {
        static var buildType: BuildType = .pro
        
        static var serverURL: String {
            switch buildType {
            case .dev:
                return "https://sea.sanskargroup.in:5320"
            case .pro:
                return "https://sea.sanskargroup.in:5320"
            }
        }
    }
}

struct Constant {

    static let sendOtp                               = "api/auth/send-otp"
    static let verifyOtp                             = "api/auth/verify-otp"
    
}


