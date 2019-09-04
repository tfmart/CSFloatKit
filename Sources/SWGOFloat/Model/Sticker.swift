//
//  Sticker.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

public struct Sticker: Decodable {
    public let stickerID: String?
    public let slot: Int?
    public let codename: String?
    public let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case slot, codename, name
        case stickerID = "stickerId"
    }
}
