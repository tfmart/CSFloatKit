//
//  Sticker.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

@objc public class Sticker: NSObject, Decodable {
    /// The sticker's ID number
    @objc public let stickerID: String?
    /// The position in which the sticker is applied in the weapon
    public let slot: Int?
    /// The sticker's codename
    @objc public let codename: String?
    /// The sticker's name
    @objc public let name: String?
    
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


// MARK: - Extension

public extension Sticker {
    /// Get the sticker's image URL
    func getImageURL() -> String? {
        guard let name = self.name else { return nil }
        let completeName = "Sticker | \(name)"
        guard let encodedName = completeName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return nil }
        let baseURL = "http://api.steamapis.com/image/item/730/"
        return "\(baseURL)\(encodedName)"
    }
}
