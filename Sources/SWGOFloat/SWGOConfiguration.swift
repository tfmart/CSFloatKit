//
//  File.swift
//  
//
//  Created by Tomás Feitoza Martins  on 04/11/19.
//

import Foundation

public class SWGOConfiguration {
    /// A weapon's inspect link
    var inspectLink: String?
    /// Inspect link "s" parameter, if the item is from an player's inventory
    var inventoryParameter: String?
    /// Inspect link "a" parameter
    var aParameter: String?
    /// Inspect link "d" paramete
    var dParameter: String?
    /// Inspect link "m" parameter, if the item is from the Community Market
    var marketParameter: String?
    
    private let baseURL = "https://api.csgofloat.com/"
    
    /// Instantiate FloatController with the S, A, D and M parameters
    public init(inventoryParameter: String?, aParameter: String, dParameter: String, marketParameter: String?) {
        self.inventoryParameter = inventoryParameter
        self.aParameter = aParameter
        self.dParameter = dParameter
        self.marketParameter = marketParameter
        self.inspectLink = nil
    }
    
    /// Instantiate FloatController with an item's inpect link
    init(inspectLink: String) {
        self.inspectLink = inspectLink
        self.inventoryParameter = nil
        self.aParameter = nil
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
        } else if let aParameter = self.aParameter, let dParameter = self.dParameter {
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
