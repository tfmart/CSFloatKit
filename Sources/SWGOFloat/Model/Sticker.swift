//
//  Sticker.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

public class Sticker: Decodable {
    public let stickerID: String?
    public let slot: Int?
    public let codename: String?
    public let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case slot, codename, name
        case stickerID = "stickerId"
    }
    
    required public init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.stickerID = try? container.decode(String.self, forKey: .stickerID)
        self.slot = try? container.decode(Int.self, forKey: .slot)
        self.codename = try? container.decode(String.self, forKey: .codename)
        self.name = try? container.decode(String.self, forKey: .name)
    }
}
