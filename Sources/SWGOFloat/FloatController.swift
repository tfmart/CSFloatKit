//
//  FloatController.swift
//  
//
//  Created by Tomás Feitoza Martins  on 03/09/19.
//

import Foundation

public class FloatController {
    public static let shared = FloatController()
    private init() {}
    /// A weapon's inspect link
    public var inspectLink: String?
    /// A weapon's S, A, D and M parameters
    public var sParameter: String?
    public var aParameter: String?
    public var dParameter: String?
    public var mParatemer: String?
    
    private let baseURL = "https://api.csgofloat.com/"
    
    /// Instantiate FloatController with an item's S, A, D and M parameters
    public init(sParameter: String?, aParameter: String, dParameter: String, mParameter: String?) {
        self.sParameter = sParameter
        self.aParameter = aParameter
        self.dParameter = dParameter
        self.mParatemer = mParameter
    }
    
    /// Instantiate FloatController with an item's inpect link
    public init(inspectLink: String) {
        self.inspectLink = inspectLink
    }
    
    private func setRequestURL() -> String {
        if let inspectLink = self.inspectLink {
            return "\(baseURL)?url=\(inspectLink)"
        } else if let aParameter = self.aParameter, let dParameter = self.dParameter {
            return "\(baseURL)?s=\(self.aParameter ?? "")&a=\(aParameter)&d=\(dParameter)&m=\(self.mParatemer ?? "")"
        } else {
            return ""
        }
    }
    
    public func getWeaponInfo(completion: @escaping (Result<WeaponSkin, ApiError>) -> Void) {
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
                let fetchedWeapon = try JSONDecoder().decode(WeaponSkin.self, from: data)
                guard let errorCode = fetchedWeapon.code else {
                    completion(.success(fetchedWeapon))
                    return
                }
                completion(.failure(.errorWithCode(code: errorCode)))
            } catch {
                data.printJSON()
                completion(.failure(.decodeError))
            }
        }.resume()
    }
}

extension Data
{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print(JSONString)
        }
    }
}
