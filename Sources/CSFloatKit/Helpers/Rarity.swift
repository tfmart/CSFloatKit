//
//  Rarity.swift
//  
//
//  Created by Tomas Martins on 12/04/20.
//

import Foundation

@objc public enum Rarity: Int {
    // Weapon Skin rarities
    case consumer
    case industrial
    case milSpec
    case restricted
    case classified
    case covert
    case contraband
    // Sticker, Collectible Pins, Agents and Patches rarities
    case extraordinary
    case highGrade
    case remarkable
    case exotic
    // Crate rarities
    case basic
    
     public init(skin: Skin) {
        switch skin.itemInfo?.rarityName {
        // Weapon Skin cases
        case "Contraband":
            self = .contraband
        case "Covert":
            self = .covert
        case "Classified":
            self = .classified
        case "Restricted":
            self = .restricted
        case "Mil-Spec Grade":
            self = .milSpec
        case "Industrual Grade":
            self = .industrial
        case "Consumer Grade":
            self = .consumer
        //Sticker, Collectible Pins and Agents cases
        case "Extraordinary":
            self = .extraordinary
        case "Exotic":
            self = .exotic
        case "Remarkable":
            self = .remarkable
        case "High Grade":
            self = .highGrade
        //Other
        default:
            self = .basic
        }
    }
}
