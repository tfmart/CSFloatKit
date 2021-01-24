//
//  CSMSkin.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

// MARK: - CSMItem
internal struct CSMSkin: Codable {
    let item: CSMItem?
    var isBot: Bool = false
    var botInventory: Bool =  false
    var isInGame: Bool =  false
    
    internal init(id: Int) {
        let item = CSMItem(id: id)
        self = CSMSkin(item: item)
    }
    
    private init(item: CSMItem?, isBot: Bool = false, botInventory: Bool = false, isInGame: Bool = false) {
        self.item = item
        self.isBot = isBot
        self.botInventory = botInventory
        self.isInGame = isInGame
    }
}

// MARK: - Item
struct CSMItem: Codable {
    let id: Int?
}
