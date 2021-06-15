//
//  CSMRequester.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

/// An object that represents a CS.Money screenshot service request to be made
@objc public class CSMRequester: NSObject {
    /// Completion handler to be executed after the request, which could either return an item's screenshot or a error message
    public var completion: ((CSMScreenshot?, CSMError) -> Void)
    private var configuration: CSMConfiguration
    
    /// Initialize a request service using an instance of CSMConfiguration and a completion handler to be executed after the request is completed
    /// - Parameters:
    ///   - configuration: An instance of CSMConfiguration to be used by the request to fetch the screenshot of it's configured item inspect link
    ///   - completion: A block of code to be executed when the request is completed. It will also return either the item's screenshot image or an instance of CSMError
    @objc public init(configuration: CSMConfiguration,
                      completion: @escaping ((CSMScreenshot?, CSMError) -> Void)) {
        self.completion = completion
        self.configuration = configuration
    }
    
    // MARK: - Screenshot Request methods
    
    /// Starts the screenshot request
    @objc public func start() {
        guard let requestURL = URL(string: configuration.screenshotRequestURL) else {
            completion(nil, .urlError)
            return
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("https://cs.money", forHTTPHeaderField: "Origin")
        
        do {
            let encoder = JSONEncoder()
            let skin = CSMSkin(id: configuration.id)
            let skinData = try encoder.encode(skin)
            request.httpBody = skinData
            URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
                guard let screenshotData = data else {
                    self.completion(nil, .unknownError)
                    return
                }
                self.parseJson(data: screenshotData)
                if error != nil {
                    self.completion(nil, .unknownError)
                }
            }.resume()
            
        } catch {
            completion(nil, .encodeError)
        }
    }
    
    private func parseJson(data: Data) {
        do {
            let decodedObject = try self.parseData(data: data)
            if let errorCode = decodedObject.error {
                let error = CSMError(withCode: errorCode)
                completion(nil, error)
            } else {
                completion(decodedObject, .noError)
            }
        }
        catch {
            completion(nil, .decodeError)
        }
    }
    
    private func parseData(data: Data) throws -> CSMScreenshot {
        do {
            let decoder = JSONDecoder()
            let decodedScreenshot = try decoder.decode(CSMScreenshot.self, from: data)
            return decodedScreenshot
        } catch {
            throw CSMError.decodeError
        }
    }
}
