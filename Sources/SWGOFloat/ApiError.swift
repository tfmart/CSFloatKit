//
//  ApiError.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

/// Contains the possible erros during the API request
@objc public enum ApiError: Int, Error {
    /// CSGOFloat API Error 1: The parameters sent on the request's URL are invalid
    case invalidParameters
    /// CSGOFloat API Error 2: The inspect link sent on the request is invalid
    case invalidInspectLink
    /// CSGOFloat API Error 3: The user has reached the maximum amount of pending requests
    case maxPendingRequests
    /// CSGOFloat API Error 4: The server didn't reply on time
    case serverTimeout
    /// CSGOFloat API Error 5: The server could not be reached at the moment
    case serverUnavailable
    /// Could not create a URL from the information recieved
    case urlError
    /// Could not decode a Skin from the data provided
    case decodeError
    /// Unknown error for an unexpected case
    case unknownError
    /// When the requested is completed successfully
    case noError
    
    /**
     Determines which error ocurred from the recieved code
     
     - Parameters:
       - code: The CSGOFloat API error code
     - Returns: The error related to the recieved code
    */
    static func errorWithCode(code: Int) -> ApiError {
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
    
    /// Returns an error message for each error case
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
        case .urlError:
            return "The input is not a valid URL"
        case .decodeError:
            return "The data returned could not be read"
        case .unknownError:
            return "An unknown error occurred"
        case .noError:
            return "The request was successful"
        }
    }
    
    //Objective-C only properties
    ///The error message, represented in NSString type
    @available(swift, obsoleted: 1.0)
    public func errorMessage() -> NSString {
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
        case .urlError:
            return "The input is not a valid URL"
        case .decodeError:
            return "The data returned could not be read"
        case .unknownError:
            return "An unknown error occurred"
        case .noError:
            return "The request was successful"
        }
    }
}
