//
//  Sticker.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

struct Sticker: Decodable {
    private enum CodingKeys: String, CodingKey {
        let stickerID: String?
        let slot: Int?
        let codename: String?
        let name: String?
    }
    
    private enum CodingKeys: String, CodingKey {
        case slot, codename, name
        case stickerID = "stickerId"
    }
}
