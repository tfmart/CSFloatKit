//
//  ItemInfo.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

@objc public class ItemInfo: NSObject, Decodable {
    /// The item's float value, representing it's wear
    public let floatValue: Float?
    /// The name of the weapon's skin
    public let name: String?
    /// The weapon's type
    public let weapon: String?
    /// The skin's image URL
    public let imageURL: String?
    /// If the weapon is StatTrak, the amount of kills registered
    public let statTrak: Int?
    /// The weapon's rarity
    public let rarity: Int?
    /// The skin's ID
    public let itemID: String?
    /// The weapon's ID
    public let weaponID: Int?
    /// The weapon's Paint ID
    public let paintIndex: Int?
    /// The weapon's Paint Seed
    public let paintseed: Int?
    /// If the weapon has a name tag, the weapon's custom name
    public let nameTag: String?
    /// The stickers applied to the weapon
    public let stickers: [Sticker]?
    /// Inventory ID
    public let inventory: Int?
    /// The weapon's Origin ID
    public let originID: Int?
    /// The skin's lowest float value possible
    public let minFloat: Float?
    /// The skin's highest float value possible
    public let maxFloat: Float?
    /// The weapon's origin
    public let origin: String?
    /// The weapon's quality name (Souvenir, StatTrak, etc...)
    public let qualityName: String?
    /// The weapon's rarity name
    public let rarityName: String?
    /// The weapon's wear (Factory New, Field-Tested, etc...)
    public let wear: String?
    /// A string with the weapon's name, the skin's name and it's condition name
    public let fullItemName: String?
    /// The S parameter from the item's inspect link
    public let inventoryParameter: String?
    /// The A parameter from the item's inspect link
    public let aParameter: String?
    /// The D parameter from the item's inspect link
    public let dParameter: String?
    /// The M parameter from the item's inspect link
    public let marketParameter: String?
    
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
        case inventoryParameter = "s"
        case aParameter = "a"
        case dParameter = "d"
        case marketParameter = "m"
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
        self.inventoryParameter = try? container.decode(String.self, forKey: .inventoryParameter)
        self.aParameter = try? container.decode(String.self, forKey: .aParameter)
        self.dParameter = try? container.decode(String.self, forKey: .dParameter)
        self.marketParameter = try? container.decode(String.self, forKey: .marketParameter)
    }
}
