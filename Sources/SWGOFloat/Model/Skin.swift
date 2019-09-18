//
//  WeaponSkin.swift
//  
//
//  Created by Tomas Martins on 02/09/19.
//

import Foundation

public class Skin: Decodable {
    /// Contains all the information about the skin
    public let itemInfo: ItemInfo?
    /// The error message, in case the API returns an error
    public let error: String?
    /// The error code, in case the API returns an error
    public let code: Int?
    
    private enum CodingKeys: String, CodingKey {
        case error, code
        case itemInfo = "iteminfo"
    }
    
    required public init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.itemInfo = try? container.decode(ItemInfo.self, forKey: .itemInfo)
        self.code = try? container.decode(Int.self, forKey: .code)
        self.error = try? container.decode(String.self, forKey: .error)
    }
}

// MARK: - Extension

public extension Skin {
    /// Boolean value indicating whether the skin is StatTrak
    var isStatTrak: Bool {
        guard let weaponInfo = self.itemInfo, weaponInfo.statTrak != nil else {
            return false
        }
        return true
    }
    
    /// Boolean value indicating whether the skin has painting applied
    var isVanilla: Bool {
        guard let weaponInfo = self.itemInfo, weaponInfo.name == "-" else {
            return false
        }
        return true
    }
}

