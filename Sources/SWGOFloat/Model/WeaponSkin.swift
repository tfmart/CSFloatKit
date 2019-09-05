//
//  WeaponSkin.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

public class WeaponSkin: Decodable {
    public let iteminfo: ItemInfo?
    let error: String?
    let code: Int?
}

// MARK: - Extension

public extension WeaponSkin {
    /// Boolean value indicating whether the skin is StatTrak
    var isStatTrak: Bool {
        guard let weaponInfo = self.iteminfo, weaponInfo.statTrak != nil else {
            return false
        }
        return true
    }
    
    /// Boolean value indicating whether the skin has painting applied
    var isVanilla: Bool {
        guard let weaponInfo = self.iteminfo, weaponInfo.name == "-" else {
            return false
        }
        return true
    }
}

