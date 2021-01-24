//
//  CSMRequester.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

@objc public class CSMRequester: NSObject {
    public var screenshotCompletion: ((CSMScreenshot?, CSMError) -> Void)?
    public var itemInfoCompletion: ((CSMItemInfo?, CSMError) -> Void)?
    private var configuration: CSMConfiguration
    
    @objc public init(configuration: CSMConfiguration,
                      screenshotCompletion: ((CSMScreenshot?, CSMError) -> Void)? = nil,
                      itemInfoCompletion: ((CSMItemInfo?, CSMError) -> Void)? = nil) {
        self.screenshotCompletion = screenshotCompletion
        self.itemInfoCompletion = itemInfoCompletion
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
    
    // MARK: - Item Info Request methods
    
    /// Starts the item info request
    @objc public func getItemInfo() {
        guard let requestURL = URL(string: configuration.itemInfoRequestURL) else {
            itemInfoCompletion?(nil, .urlError)
            return
        }
        dump(requestURL)
        var request = URLRequest(url: requestURL)
        request.addValue("", forHTTPHeaderField: "Cookie")
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            guard let data = data else {
                self.itemInfoCompletion?(nil, .unknownError)
                return
            }
            #if DEBUG
            let responseData = String(data: data, encoding: String.Encoding.utf8)
            dump(responseData)
            #endif
            self.parseScreenshotJson(data: data)
            if error != nil {
                self.itemInfoCompletion?(nil, .unknownError)
            }
            self.parseInfoJson(data: data)
            if error != nil {
                self.itemInfoCompletion?(nil, .unknownError)
            }
        }.resume()
    }
    
    private func parseInfoJson(data: Data) {
        do {
            let decodedObject = try self.parseInfoData(data: data)
            if let errorCode = decodedObject.error {
                let error = CSMError(withCode: errorCode)
                itemInfoCompletion?(nil, error)
            } else {
                itemInfoCompletion?(decodedObject, .noError)
            }
        }
        catch {
            itemInfoCompletion?(nil, .decodeError)
        }
    }
    
    private func parseInfoData(data: Data) throws -> CSMItemInfo {
        do {
            let decoder = JSONDecoder()
            let decodedItem = try decoder.decode(CSMItemInfo.self, from: data)
            return decodedItem
        } catch {
            throw CSMError.decodeError
        }
    }
}
