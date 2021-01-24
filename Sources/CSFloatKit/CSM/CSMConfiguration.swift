//
//  CSMConfiguration.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

@objc public class CSMConfiguration: NSObject {
    /// The ID number of skin, usually it's the weapon's asset parameter (the A parameter from an inspect link)
    var id: Int
    
    private let baseURL = "https://cs.money"
    private let screenshotURL = "/screenshots"
    private let itemInfoURL = "/skin_info"
    
    /// Instantiate CSMConfiguration with a skin object
    @objc public init?(skin: Skin) {
        // Checks if the inspect link is from an item from an inventory. CSM service doesn't support inspect links from the Steam Community Market
        guard let inventoryParameter = skin.itemInfo?.inventoryParameter, Int(inventoryParameter) != 0, let asset = skin.itemInfo?.aParameter, let assetInt = Int(asset) else {
            return nil
        }
        self.id = assetInt
    }
    
    /// Instantiate CSMConfiguration with a inspect link
    @objc public init?(inspectLink: String) {
        let regex = "(?:steam:\\/\\/rungame\\/730\\/76561202255233023\\/\\+csgo_econ_action_preview%20S(?:[A-Za-z0-9_\\-]{17}A)([A-Za-z0-9_\\-]{11}))"
        let assetRange = NSRange(location: 0, length: inspectLink.utf16.count)
        do {
            let expression = try NSRegularExpression(pattern: regex)
            let firstMatch = expression.firstMatch(in: inspectLink, options: [], range: assetRange)
            guard let nsRange = firstMatch?.range(at: 1),
                  let asset = Range(nsRange, in: inspectLink),
                  let id = Int(inspectLink[asset]) else { return nil }
            self.id = id
        } catch {
            return nil
        }
        
    }
    
    public var screenshotRequestURL: String {
        return "\(baseURL)\(screenshotURL)"
    }
    
    public var itemInfoRequestURL: String {
        return "\(baseURL)\(itemInfoURL)?appId=730&id=\(id)&isBot=false"
    }
}
