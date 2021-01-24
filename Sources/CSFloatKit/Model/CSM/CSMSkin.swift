//
//  CSMSkin.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

// MARK: - CSMItem
/// Object to be encoded and sent at the CSM Screenshot service
internal struct CSMSkin: Codable {
    let item: CSMItem?
    var isBot: Bool = false
    var botInventory: Bool =  false
    var isInGame: Bool =  false
    
    internal init(id: Int, isBot: Bool = false, botInventory: Bool = false, isInGame: Bool = false) {
        self.item = CSMItem(id: id)
        self.isBot = isBot
        self.botInventory = botInventory
        self.isInGame = isInGame
    }
}

// MARK: - Item
internal struct CSMItem: Codable {
    let id: Int?
}
