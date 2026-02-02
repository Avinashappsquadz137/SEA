//
//  VerifyOTPResponse.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 02/02/26.
//
import Foundation
struct VerifyOTPResponse : Codable {
    let success : Bool?
    let message : String?
    let data : VerifyOTP?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(VerifyOTP.self, forKey: .data)
    }

}

struct VerifyOTP : Codable {
    let accessToken : String?
    let refreshToken : String?

    enum CodingKeys: String, CodingKey {

        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
        refreshToken = try values.decodeIfPresent(String.self, forKey: .refreshToken)
    }

}
