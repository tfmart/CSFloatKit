//
//  FloatController.swift
//  
//
//  Created by Tomás Feitoza Martins  on 03/09/19.
//

import Foundation

public class SWGORequester {
    public static let shared = SWGORequester()
    private init() {}
    /// A weapon's inspect link
    public var inspectLink: String?
    /// Inspect link "s" parameter, if the item is from an player's inventory
    public var inventoryParameter: String?
    /// Inspect link "a" parameter
    public var aParameter: String?
    /// Inspect link "d" parameter
    public var dParameter: String?
    /// Inspect link "m" parameter, if the item is from the Community Market
    public var marketParameter: String?
    
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
    public init(inspectLink: String) {
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
    private func setRequestURL() -> String {
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
    
    /**
     Makes the CSGO Float API request to get an item's information
     
     - Returns: A Result type, representing either a Skin in case of success or an ApiError in case the request fails
    */
    public func getWeaponInfo(completion: @escaping (Result<Skin, ApiError>) -> Void) {
        let urlRequest = setRequestURL()
        guard let url = URL(string: urlRequest) else {
            completion(.failure(.urlError))
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.unknownError))
                return
            }
            guard let data = data else {
                completion(.failure(.unknownError))
                return
            }
            
            do {
                let fetchedWeapon = try JSONDecoder().decode(Skin.self, from: data)
                guard let errorCode = fetchedWeapon.code else {
                    completion(.success(fetchedWeapon))
                    return
                }
                completion(.failure(.errorWithCode(code: errorCode)))
            } catch {
                completion(.failure(.decodeError))
            }
        }.resume()
    }
}
