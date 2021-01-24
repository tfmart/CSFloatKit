//
//  Sticker.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

@objc public class Sticker: NSObject, NSCoding, Decodable {
    /// The sticker's ID number
    @objc public let stickerID: String?
    /// The position in which the sticker is applied in the weapon
    public let slot: Int?
    /// The sticker's codename
    @objc public let codename: String?
    /// The sticker's name
    @objc public let name: String?
    /// The sticker's scrapped wear
    public let wear: Double?
    /// The sticker's material
    @objc public let material: String?
    
    //Objective-C only properties
    /// The position in which the sticker is applied in the weapon in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsCode: NSNumber? {
        return slot as NSNumber?
    }
    /// The sticker's scrapped wear in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsWear: NSNumber? {
        return slot as NSNumber?
    }
    
    private enum CodingKeys: String, CodingKey {
        case slot, codename, name, wear, material
        case stickerID = "stickerId"
    }
    
    required public init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.stickerID = try? container.decode(String.self, forKey: .stickerID)
        self.slot = try? container.decode(Int.self, forKey: .slot)
        self.codename = try? container.decode(String.self, forKey: .codename)
        self.name = try? container.decode(String.self, forKey: .name)
        self.material = try? container.decode(String.self, forKey: .material)
        self.wear = try? container.decode(Double.self, forKey: .wear)
    }
    
    //MARK: - NSCoding methods
    public func encode(with coder: NSCoder) {
        coder.encode(stickerID, forKey: CodingKeys.stickerID.rawValue)
        coder.encode(slot, forKey: CodingKeys.slot.rawValue)
        coder.encode(codename, forKey: CodingKeys.codename.rawValue)
        coder.encode(name, forKey: CodingKeys.name.rawValue)
    }
    
    private init(stickerID: String?, slot: Int?, codename: String?, name: String?, wear: Double?, material: String?) {
        self.stickerID = stickerID
        self.slot = slot
        self.codename = codename
        self.name = name
        self.wear = wear
        self.material = material
    }
    
    required convenience public init?(coder: NSCoder) {
        let stickerID = coder.decodeObject(forKey: CodingKeys.stickerID.rawValue) as? String
        let slot = coder.decodeObject(forKey: CodingKeys.slot.rawValue) as? Int
        let codename = coder.decodeObject(forKey: CodingKeys.codename.rawValue) as? String
        let name = coder.decodeObject(forKey: CodingKeys.name.rawValue) as? String
        let wear = coder.decodeObject(forKey: CodingKeys.wear.rawValue) as? Double
        let material = coder.decodeObject(forKey: CodingKeys.material.rawValue) as? String
        self.init(stickerID: stickerID, slot: slot, codename: codename, name: name, wear: wear, material: material)
    }
}


// MARK: - Extension

public extension Sticker {
    /// Get the sticker's image URL
    @objc var imageURL: String? {
        guard let name = self.name else { return nil }
        let completeName = "Sticker | \(name)"
        guard let encodedName = completeName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return nil }
        let baseURL = "http://api.steamapis.com/image/item/730/"
        return "\(baseURL)\(encodedName)"
    }
}
