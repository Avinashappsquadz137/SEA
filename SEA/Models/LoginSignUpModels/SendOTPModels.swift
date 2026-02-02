//
//  SendOTPModels.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 29/01/26.
//
import Foundation

struct SendOTPModels : Codable {
    let success : Bool?
    let message : String?
    let data : OTPModel?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(OTPModel.self, forKey: .data)
    }

}

struct OTPModel : Codable {
    let mobile : String?

    enum CodingKeys: String, CodingKey {

        case mobile = "mobile"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let stringValue = try? container.decode(String.self, forKey: .mobile) {
            mobile = stringValue
        } else if let intValue = try? container.decode(Int.self, forKey: .mobile) {
            mobile = String(intValue)
        } else {
            mobile = nil
        }
    }

}

