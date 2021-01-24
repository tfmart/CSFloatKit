//
//  CSMSkin.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

// MARK: - CSMItem
internal struct CSMSkin: Codable {
    internal init(item: CSMItem?, isBot: Bool = false, botInventory: Bool = false, isInGame: Bool = false) {
        self.item = item
        self.isBot = isBot
        self.botInventory = botInventory
        self.isInGame = isInGame
    }
    
    let item: CSMItem?
    var isBot: Bool = false
    var botInventory: Bool =  false
    var isInGame: Bool =  false
    
    public init?(skin: Skin) {
        guard let inventoryParameter = skin.itemInfo?.inventoryParameter, Int(inventoryParameter) != 0 else {
            return nil
        }
        let item = CSMItem(id: Int(inventoryParameter))
        self = CSMSkin(item: item)
    }
}

// MARK: - Item
struct CSMItem: Codable {
    let id: Int?
}
