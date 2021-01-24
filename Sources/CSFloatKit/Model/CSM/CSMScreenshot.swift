//
//  File.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

@objc public class CSMScreenshot: NSObject, NSCoding, Codable {
    let status: Bool?
    let cached: Bool?
    let imageURL: String?
    let previewURL: String?
    let error: Int?
    
    private enum CodingKeys: String, CodingKey {
        case status = "ok"
        case cached
        case imageURL = "img"
        case previewURL = "preview"
        case error
    }
    
    //MARK: - NSCoding methods
    public func encode(with coder: NSCoder) {
        coder.encode(status, forKey: CodingKeys.status.rawValue)
        coder.encode(cached, forKey: CodingKeys.cached.rawValue)
        coder.encode(imageURL, forKey: CodingKeys.imageURL.rawValue)
        coder.encode(previewURL, forKey: CodingKeys.previewURL.rawValue)
    }
    
    fileprivate init(status: Bool?, cached: Bool?, imageURL: String?, previewURL: String?, error: Int?) {
        self.status = status
        self.cached = cached
        self.imageURL = imageURL
        self.previewURL = previewURL
        self.error = error
    }
    
    public required convenience init?(coder: NSCoder) {
        let status = coder.decodeObject(forKey: CodingKeys.status.rawValue) as? Bool
        let cached = coder.decodeObject(forKey: CodingKeys.cached.rawValue) as? Bool
        let imageURL = coder.decodeObject(forKey: CodingKeys.imageURL.rawValue) as? String
        let previewURL = coder.decodeObject(forKey: CodingKeys.previewURL.rawValue) as? String
        let error = coder.decodeObject(forKey: CodingKeys.error.rawValue) as? Int
        self.init(status: status, cached: cached, imageURL: imageURL, previewURL: previewURL, error: error)
    }
}
