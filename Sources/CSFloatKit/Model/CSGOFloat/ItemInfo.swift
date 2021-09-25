//
//  ItemInfo.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

/// Object that holds all the information available on an item
@objc public class ItemInfo: NSObject, NSCoding, Decodable {
    @objc private let httpImageUrl: String?
    /// The item's float value, representing it's wear
    public let floatValue: Float?
    /// The name of the weapon's skin
    @objc public let name: String?
    /// The weapon's type
    @objc public let weapon: String?
    /// If the weapon is StatTrak, the amount of kills registered
    public let statTrak: Int?
    /// The weapon's rarity
    public let rarity: Int?
    /// The skin's ID
    @objc public let itemID: String?
    /// The weapon's ID
    public let weaponID: Int?
    /// The weapon's Paint ID
    public let paintIndex: Int?
    /// The weapon's Paint Seed
    public let paintseed: Int?
    /// If the weapon has a name tag, the weapon's custom name
    @objc public let nameTag: String?
    /// The stickers applied to the weapon
    @objc public let stickers: [Sticker]?
    /// Inventory ID
    public let inventory: Int?
    /// The weapon's Origin ID
    public let originID: Int?
    /// The skin's lowest float value possible
    public let minFloat: Float?
    /// The skin's highest float value possible
    public let maxFloat: Float?
    /// The weapon's origin
    @objc public let origin: String?
    /// The weapon's quality name (Souvenir, StatTrak, etc...)
    @objc public let qualityName: String?
    /// The weapon's rarity name
    @objc public let rarityName: String?
    /// The weapon's wear (Factory New, Field-Tested, etc...)
    @objc public let wear: String?
    /// A string with the weapon's name, the skin's name and it's condition name
    @objc public let fullItemName: String?
    /// The S parameter from the item's inspect link
    @objc public let inventoryParameter: String?
    /// The A parameter from the item's inspect link
    @objc public let aParameter: String?
    /// The D parameter from the item's inspect link
    @objc public let dParameter: String?
    /// The M parameter from the item's inspect link
    @objc public let marketParameter: String?
    
    //MARK: - Objective-C only properties
    /// An Objective-C only property, it represents the item's float value, representing it's wear in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsFloatValue: NSNumber? {
        return floatValue as NSNumber?
    }
    /// An Objective-C only property, it represents thethe weapon is StatTrak, the amount of kills registered in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsStatTrak: NSNumber? {
        return statTrak as NSNumber?
    }
    /// An Objective-C only property, it represents the weapon's rarity in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsRarity: NSNumber? {
        return rarity as NSNumber?
    }
    /// An Objective-C only property, it represents the weapon's ID in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsWeaponID: NSNumber? {
        return weaponID as NSNumber?
    }
    /// An Objective-C only property, it represents the skin's paint index in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsPaintIndex: NSNumber? {
        return paintIndex as NSNumber?
    }
    /// An Objective-C only property, it represents the weapon's paint seed in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsPaintseed: NSNumber? {
        return paintseed as NSNumber?
    }
    /// An Objective-C only property, it represents the inventory ID in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsInventory: NSNumber? {
        return inventory as NSNumber?
    }
    /// An Objective-C only property, it represents the weapon's origin ID in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsOriginID: NSNumber? {
        return originID as NSNumber?
    }
    /// An Objective-C only property, it represents the skin's lowest float value possible in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsMinFloat: NSNumber? {
        return minFloat as NSNumber?
    }
    /// An Objective-C only property, it represents the skin's highest float value possible in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsMaxFloat: NSNumber? {
        return maxFloat as NSNumber?
    }
    
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
        self.httpImageUrl = try? container.decode(String.self, forKey: .imageURL)
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
    
    //MARK: - NSCoding methods
    public func encode(with coder: NSCoder) {
        coder.encode(floatValue, forKey: CodingKeys.floatValue.rawValue)
        coder.encode(name, forKey: CodingKeys.name.rawValue)
        coder.encode(weapon, forKey: CodingKeys.weapon.rawValue)
        coder.encode(httpImageUrl, forKey: CodingKeys.imageURL.rawValue)
        coder.encode(statTrak, forKey: CodingKeys.statTrak.rawValue)
        coder.encode(rarity, forKey: CodingKeys.rarity.rawValue)
        coder.encode(itemID, forKey: CodingKeys.itemID.rawValue)
        coder.encode(weaponID, forKey: CodingKeys.weaponID.rawValue)
        coder.encode(paintIndex, forKey: CodingKeys.paintIndex.rawValue)
        coder.encode(paintseed, forKey: CodingKeys.paintseed.rawValue)
        coder.encode(nameTag, forKey: CodingKeys.nameTag.rawValue)
        coder.encode(stickers, forKey: CodingKeys.stickers.rawValue)
        coder.encode(inventory, forKey: CodingKeys.inventory.rawValue)
        coder.encode(originID, forKey: CodingKeys.originID.rawValue)
        coder.encode(minFloat, forKey: CodingKeys.minFloat.rawValue)
        coder.encode(maxFloat, forKey: CodingKeys.maxFloat.rawValue)
        coder.encode(origin, forKey: CodingKeys.origin.rawValue)
        coder.encode(qualityName, forKey: CodingKeys.qualityName.rawValue)
        coder.encode(rarityName, forKey: CodingKeys.rarityName.rawValue)
        coder.encode(wear, forKey: CodingKeys.wear.rawValue)
        coder.encode(fullItemName, forKey: CodingKeys.fullItemName.rawValue)
        coder.encode(inventoryParameter, forKey: CodingKeys.inventoryParameter.rawValue)
        coder.encode(aParameter, forKey: CodingKeys.aParameter.rawValue)
        coder.encode(dParameter, forKey: CodingKeys.dParameter.rawValue)
        coder.encode(marketParameter, forKey: CodingKeys.marketParameter.rawValue)
    }
    
    private init(floatValue: Float?, name: String?, weapon: String?, imageURL: String?, statTrak: Int?, rarity: Int?, itemID: String?, weaponID: Int?, paintIndex: Int?, paintseed: Int?, nameTag: String?, stickers: [Sticker]?, inventory: Int?, originID: Int?, minFloat: Float?, maxFloat: Float?, origin: String?, qualityName: String?, rarityName: String?, wear: String?, fullItemName: String?, inventoryParameter: String?, aParameter: String?, dParameter: String?, marketParameter: String?) {
        self.floatValue = floatValue
        self.name = name
        self.weapon = weapon
        self.httpImageUrl = imageURL
        self.statTrak = statTrak
        self.rarity = rarity
        self.itemID = itemID
        self.weaponID = weaponID
        self.paintIndex = paintIndex
        self.paintseed = paintseed
        self.nameTag = nameTag
        self.stickers = stickers
        self.inventory = inventory
        self.originID = originID
        self.minFloat = minFloat
        self.maxFloat = maxFloat
        self.origin = origin
        self.qualityName = qualityName
        self.rarityName = rarityName
        self.wear = wear
        self.fullItemName = fullItemName
        self.inventoryParameter = inventoryParameter
        self.aParameter = aParameter
        self.dParameter = dParameter
        self.marketParameter = marketParameter
    }
    
    required convenience public init?(coder: NSCoder) {
        let floatValue = coder.decodeObject(forKey: CodingKeys.floatValue.rawValue) as? Float
        let name = coder.decodeObject(forKey: CodingKeys.name.rawValue) as? String
        let weapon = coder.decodeObject(forKey: CodingKeys.weapon.rawValue) as? String
        let imageURL = coder.decodeObject(forKey: CodingKeys.imageURL.rawValue) as? String
        let statTrak = coder.decodeObject(forKey: CodingKeys.statTrak.rawValue) as? Int
        let rarity = coder.decodeObject(forKey: CodingKeys.rarity.rawValue) as? Int
        let itemID = coder.decodeObject(forKey: CodingKeys.itemID.rawValue) as? String
        let weaponID = coder.decodeObject(forKey: CodingKeys.weaponID.rawValue) as? Int
        let paintIndex = coder.decodeObject(forKey: CodingKeys.paintIndex.rawValue) as? Int
        let paintseed = coder.decodeObject(forKey: CodingKeys.paintseed.rawValue) as? Int
        let nameTag = coder.decodeObject(forKey: CodingKeys.nameTag.rawValue) as? String
        let stickers = coder.decodeObject(forKey: CodingKeys.stickers.rawValue) as? [Sticker]
        let inventory = coder.decodeObject(forKey: CodingKeys.inventory.rawValue) as? Int
        let originID = coder.decodeObject(forKey: CodingKeys.originID.rawValue) as? Int
        let minFloat = coder.decodeObject(forKey: CodingKeys.minFloat.rawValue) as? Float
        let maxFloat = coder.decodeObject(forKey: CodingKeys.maxFloat.rawValue) as? Float
        let origin = coder.decodeObject(forKey: CodingKeys.originID.rawValue) as? String
        let qualityName = coder.decodeObject(forKey: CodingKeys.qualityName.rawValue) as? String
        let rarityName = coder.decodeObject(forKey: CodingKeys.rarityName.rawValue) as? String
        let wear = coder.decodeObject(forKey: CodingKeys.wear.rawValue) as? String
        let fullItemName = coder.decodeObject(forKey: CodingKeys.fullItemName.rawValue) as? String
        let inventoryParameter = coder.decodeObject(forKey: CodingKeys.inventoryParameter.rawValue) as? String
        let aParameter = coder.decodeObject(forKey: CodingKeys.aParameter.rawValue) as? String
        let dParameter = coder.decodeObject(forKey: CodingKeys.dParameter.rawValue) as? String
        let marketParameter = coder.decodeObject(forKey: CodingKeys.marketParameter.rawValue) as? String
        self.init(floatValue: floatValue, name: name, weapon: weapon, imageURL: imageURL, statTrak: statTrak, rarity: rarity, itemID: itemID, weaponID: weaponID, paintIndex: paintIndex, paintseed: paintseed, nameTag: nameTag, stickers: stickers, inventory: inventory, originID: originID, minFloat: minFloat, maxFloat: maxFloat, origin: origin, qualityName: qualityName, rarityName: rarityName, wear: wear, fullItemName: fullItemName, inventoryParameter: inventoryParameter, aParameter: aParameter, dParameter: dParameter, marketParameter: marketParameter)
    }
}

extension ItemInfo {
    /// The skin's image URL
    @objc var imageUrl: String? {
        guard let url = self.httpImageUrl else { return nil }
        guard url.hasPrefix("http://") else { return httpImageUrl }
        return url.replacingOccurrences(of: "http://", with: "https://")
    }
}
