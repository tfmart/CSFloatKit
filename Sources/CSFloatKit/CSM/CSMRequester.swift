//
//  CSMRequester.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

@objc public class CSMRequester: NSObject {
    public var completion: ((CSMScreenshot?, CSMError) -> Void)
    private var configuration: CSMConfiguration
    
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
