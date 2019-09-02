//
//  ApiError.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

public enum ApiError {
    case invalidParameters
    case invalidInspectLink
    case maxPendingRequests
    case serverTimeout
    case serverUnavailable
    case unknownError
    
    static func errorWithCode(code: Int) -> APIError {
        switch code {
        case 1:
            return .invalidParameters
        case 2:
            return .invalidInspectLink
        case 3:
            return .maxPendingRequests
        case 4:
            return .serverTimeout
        case 5:
            return .serverUnavailable
        default:
            return .unknownError
        }
    }
    
    public var message: String {
        switch self {
        case .invalidParameters:
            return "Improper Parameter Structure"
        case .invalidInspectLink:
            return "Invalid Inspect Link Structure"
        case .maxPendingRequests:
            return "You reached the maximum amount of simultaneous requests. Please try again"
        case .serverTimeout:
            return "Valve's servers didn't reply in time"
        case .serverUnavailable:
            return "Valve's servers appear to be offline, please try again later!"
        case .unknownError:
            return "An unknown error occurred"
        }
    }
}
