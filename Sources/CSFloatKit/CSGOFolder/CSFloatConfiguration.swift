//
//  CSFloatConfiguration.swift
//  
//
//  Created by Tomás Feitoza Martins  on 04/11/19.
//

import Foundation

@objc public class CSFloatConfiguration: NSObject {
    /// A weapon's inspect link
    var inspectLink: String?
    /// Inspect link "s" parameter, if the item is from an player's inventory
    var inventoryParameter: String?
    /// Inspect link "a" parameter, which represents the link's assets
    var assetParameter: String?
    /// Inspect link "d" paramete
    var dParameter: String?
    /// Inspect link "m" parameter, if the item is from the Community Market
    var marketParameter: String?
    
    private let baseURL = "https://api.csgofloat.com/"
    
    /// Instantiate CSFloatConfiguration with the S, A, D and M parameters
    @objc public init(inventoryParameter: String?, assetParameter: String, dParameter: String, marketParameter: String?) {
        self.inventoryParameter = inventoryParameter
        self.assetParameter = assetParameter
        self.dParameter = dParameter
        self.marketParameter = marketParameter
        self.inspectLink = nil
    }
    
    /// Instantiate CSFloatConfiguration with an item's inpect link
    @objc public init(inspectLink: String) {
        self.inspectLink = inspectLink
        self.inventoryParameter = nil
        self.assetParameter = nil
        self.dParameter = nil
        self.marketParameter = nil
    }
    
    /**
     Sets the Request URL depending of which parameters were initiated
     
     - Returns: A string representing the URL to be used in the request
    */
    public var requestURL: String {
        if let inspectLink = self.inspectLink {
            return "\(baseURL)?url=\(inspectLink)"
        } else if let aParameter = self.assetParameter, let dParameter = self.dParameter {
            var sParameter: String
            var mParameter: String
            
            if let parameter = self.inventoryParameter {
                sParameter = "s=\(parameter)&"
            } else {
                sParameter = ""
            }
            
            if let parameter = self.marketParameter {
                mParameter = "&m=\(parameter)"
            } else {
                mParameter = ""
            }
            
            return "\(baseURL)?\(sParameter)a=\(aParameter)&d=\(dParameter)\(mParameter)"
        } else {
            return ""
        }
    }
}
