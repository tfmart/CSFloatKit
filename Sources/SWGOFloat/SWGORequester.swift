//
//  SWGORequester.swift
//  
//
//  Created by Tomás Feitoza Martins  on 04/11/19.
//

import Foundation

@objc public class SWGORequester: NSObject {
    public typealias DataReturned = Skin
    public typealias Completion = ((Skin?, ApiError) -> Void)
    public var completion: ((Skin?, ApiError) -> Void)
    public var inspectLink: String
    
    
    /// Initializes the requester's inspect link and completion properties
    /// - Parameter configuration: Instance of SWGOConfiguration, which contains the input data
    /// - Parameter completion: The Completion of the request, which can return either a Skin or ApiError
    @objc public init(configuration: SWGOConfiguration, completion: @escaping Completion) {
        self.completion = completion
        self.inspectLink = configuration.requestURL
    }
    
    /// Starts the Requester
    @objc public func start() {
        guard let requestURL = URL(string: self.inspectLink) else {
            self.completion(nil, .urlError)
            return
        }
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                self.completion(nil, .unknownError)
                return
            }
            let responseData = String(data: data, encoding: String.Encoding.utf8)
            dump(responseData)
            self.parseJson(data: data)
            if error != nil {
                self.completion(nil, .unknownError)
            }
        }.resume()
    }
    
    
    /// Parses the fetched JSON
    /// - Parameter data: The data retrurned in the request
    public func parseJson(data: Data) {
        do {
            let decodedObject = try self.parseData(data: data)
            if let errorCode = decodedObject.code {
                let apiError = ApiError.errorWithCode(code: errorCode)
                completion(nil, apiError)
            } else {
                completion(decodedObject, .noError)
            }
        }
        catch {
            completion(nil, .decodeError)
        }
    }
    
    /// Parses the data feched in the request
    /// - Parameter data: The data returned in the request
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
