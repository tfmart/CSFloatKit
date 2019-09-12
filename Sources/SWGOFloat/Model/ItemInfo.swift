//
//  ItemInfo.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

public class ItemInfo: Decodable {
    public let floatValue: Float?
    public let name: String?
    public let weapon: String?
    public let imageURL: String?
    public let statTrak: Int?
    public let rarity: Int?
    public let itemID: String?
    public let weaponID: Int?
    public let paintIndex: Int?
    public let paintseed: Int?
    public let nameTag: String?
    public let stickers: [Sticker]?
    public let inventory: Int?
    public let originID: Int?
    public let minFloat: Float?
    public let maxFloat: Float?
    public let origin: String?
    public let qualityName: String?
    public let rarityName: String?
    public let wear: String?
    public let fullItemName: String?
    
    private enum CodingKeys: String, CodingKey {
        case paintseed, stickers, inventory
        case floatValue = "floatvalue"
        case name = "item_name"
        case weapon = "weapon_type"
        case imageURL = "imageurl"
        case statTrak = "killeatervalue"
        case rarity = "rarity"
        case itemID = "itemid"
        case weaponID = "defindex"
        case paintIndex = "paintindex"
        case nameTag = "customname"
        case originID = "origin"
        case minFloat = "min"
        case maxFloat = "max"
        case origin = "origin_name"
        case qualityName = "quality_name"
        case rarityName = "rarity_name"
        case wear = "wear_name"
        case fullItemName = "full_item_name"
    }
    
    required public init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.floatValue = try? container.decode(Float.self, forKey: .floatValue)
        self.name = try? container.decode(String.self, forKey: .name)
        self.weapon = try? container.decode(String.self, forKey: .weapon)
        self.imageURL = try? container.decode(String.self, forKey: .imageURL)
        self.statTrak = try? container.decode(Int.self, forKey: .statTrak)
        self.rarity = try? container.decode(Int.self, forKey: .rarity)
        self.itemID = try? container.decode(String.self, forKey: .itemID)
        self.weaponID = try? container.decode(Int.self, forKey: .weaponID)
        self.paintIndex = try? container.decode(Int.self, forKey: .paintIndex)
        self.paintseed = try? container.decode(Int.self, forKey: .paintseed)
        self.nameTag = try? container.decode(String.self, forKey: .nameTag)
        self.stickers = try? container.decode([Sticker].self, forKey: .stickers)
        self.inventory = try? container.decode(Int.self, forKey: .inventory)
        self.originID = try? container.decode(Int.self, forKey: .originID)
        self.minFloat = try? container.decode(Float.self, forKey: .minFloat)
        self.maxFloat = try? container.decode(Float.self, forKey: .maxFloat)
        self.origin = try? container.decode(String.self, forKey: .origin)
        self.qualityName = try? container.decode(String.self, forKey: .qualityName)
        self.rarityName = try? container.decode(String.self, forKey: .rarityName)
        self.wear = try? container.decode(String.self, forKey: .wear)
        self.fullItemName = try? container.decode(String.self, forKey: .fullItemName)
    }
}
