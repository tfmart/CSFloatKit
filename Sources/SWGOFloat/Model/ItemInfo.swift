//
//  ItemInfo.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

public struct ItemInfo: Decodable {
    let floatValue: Float?
    let name: String?
    let weapon: String?
    let imageURL: String?
    let statTrak: Int?
    let rarity: Int?
    let itemID: String?
    let weaponID: Int?
    let paintIndex: Int?
    let paintseed: Int?
    let nameTag: String?
    let stickers: [Sticker]?
    let inventory: Int?
    let originID: Int?
    let minFloat: Float?
    let maxFloat: Float?
    let origin: String?
    let qualityName: String?
    let rarityName: String?
    let wear: String?
    let fullItemName: String?
    
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
