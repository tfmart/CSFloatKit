//
//  File.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

@objc public enum CSMError: Int, Error {
    /// Invalid weapon ID. It usually means that the ID came from a item's inspect link from the Steam Community Market. Try again with a inspect link of an item in an inventory
    case invalidID
    /// Could not create a URL from the information recieved
    case urlError
    /// Could not encode skin data
    case encodeError
    /// Could not decode the response from the service
    case decodeError
    /// Unknown error
    case unknownError
    /// When the requested is completed successfully
    case noError
    
    init(withCode errorCode: Int) {
        switch errorCode {
        case 2:
            self = .invalidID
        default:
            self = .unknownError
        }
    }
}
