//
//  ItemInfo.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

public struct ItemInfo: Decodable {
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
}
