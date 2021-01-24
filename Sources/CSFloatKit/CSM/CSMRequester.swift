//
//  File.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

@objc public class CSMRequester: NSObject {
    public var screenshotCompletion: ((CSMScreenshot?, CSMError) -> Void)?
    public var skinInfoCompletion: ((CSMScreenshot?, CSMError) -> Void)?
    private var configuration: CSMConfiguration
    
    @objc public init(configuration: CSMConfiguration,
                      screenshotCompletion: ((CSMScreenshot?, CSMError) -> Void)? = nil,
                      skinInfoCompletion: ((CSMScreenshot?, CSMError) -> Void)? = nil) {
        self.screenshotCompletion = screenshotCompletion
        self.skinInfoCompletion = skinInfoCompletion
        self.configuration = configuration
    }
    
    // MARK: - Screenshot Request methods
    
    /// Starts the screenshot request
    @objc public func getScreenshot() {
        guard let requestURL = URL(string: configuration.screenshotRequestURL) else {
            screenshotCompletion?(nil, .urlError)
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
                    self.screenshotCompletion?(nil, .unknownError)
                    return
                }
                self.parseScreenshotJson(data: screenshotData)
                if error != nil {
                    self.screenshotCompletion?(nil, .unknownError)
                }
            }.resume()
            
        } catch {
            screenshotCompletion?(nil, .encodeError)
        }
    }
    
    private func parseScreenshotJson(data: Data) {
        do {
            let decodedObject = try self.parseScreenshotData(data: data)
            if let errorCode = decodedObject.error {
                let error = CSMError(withCode: errorCode)
                screenshotCompletion?(nil, error)
            } else {
                screenshotCompletion?(decodedObject, .noError)
            }
        }
        catch {
            screenshotCompletion?(nil, .decodeError)
        }
    }
    
    private func parseScreenshotData(data: Data) throws -> CSMScreenshot {
        do {
            let decoder = JSONDecoder()
            let decodedScreenshot = try decoder.decode(CSMScreenshot.self, from: data)
            return decodedScreenshot
        } catch {
            throw CSMError.decodeError
        }
    }
    
    // MARK: - Screenshot Request methods
    
    /// Starts the skin info request
    @objc public func getSkinInfo() {
        
    }
}
