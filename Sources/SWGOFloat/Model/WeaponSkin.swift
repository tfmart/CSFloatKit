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
    
    private enum CodingKeys: String, CodingKey {
        case iteminfo, error, code
    }
    
    required public init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iteminfo = try? container.decode(ItemInfo.self, forKey: .iteminfo)
        self.code = try? container.decode(Int.self, forKey: .code)
        self.error = try? container.decode(String.self, forKey: .error)
    }
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

