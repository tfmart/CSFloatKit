//
//  File.swift
//  
//
//  Created by Tomás Feitoza Martins  on 04/11/19.
//

import Foundation

public class SWGORequester {
    public typealias DataReturned = Skin
    public typealias Completion = ((Skin?, ApiError?) -> Void)
    public var completion: ((Skin?, ApiError?) -> Void)?
    public var inspectLink: String
    
    public init(configuration: SWGOConfiguration, completion: Completion? = nil) {
        self.completion = completion
        self.inspectLink = configuration.requestURL
    }
    
    public func start() {
        guard let requestURL = URL(string: self.inspectLink) else { return }
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = "GET"
        guard let completion = self.completion else { return }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                completion(nil, .unknownError)
                return
            }
            let responseData = String(data: data, encoding: String.Encoding.utf8)
            dump(responseData)
            self.parseJson(data: data)
            if error != nil {
                completion(nil, .unknownError)
            }
        }.resume()
    }
    
    public func parseJson(data: Data) {
        guard let completion = completion else {
            return
        }
        do {
            let decodedObject = try self.parseData(data: data)
            if let errorCode = decodedObject.code {
                let apiError = ApiError.errorWithCode(code: errorCode)
                completion(nil, apiError)
            } else {
                completion(decodedObject, nil)
            }
        }
        catch {
            completion(nil, .decodeError)
        }
    }
    
    public func parseData(data: Data) throws -> Skin{
        do {
            let decoder = JSONDecoder()
            let decodedWebsites = try decoder.decode(Skin.self, from: data)
            return decodedWebsites
        } catch {
            throw ApiError.decodeError
        }
    }

}
