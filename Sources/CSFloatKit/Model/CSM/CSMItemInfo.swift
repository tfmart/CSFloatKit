//
//  CSMItemInfo.swift
//  
//
//  Created by Tomas Martins on 24/01/21.
//

import Foundation

import Foundation

// MARK: - CSMItemInfo
/// Object returned by CSM Item Info requester, holding all the inspect link's skin properties
@objc public class CSMItemInfo: NSObject, NSCoding, Codable {
    /// Integer value representing the item's ID. Usually it's the item's inspect link asset parameter
    let id: Int?
    /// Integer representing the item's name ID
    let nameID: Int?
    /// Integer value representing ID of the game the items belongs to. For CSGO items, it will always be 730
    let appID: Int?
    /// Double value item's current price at CSM
    let price: Double?
    /// String value representing the item's float value
    let float: String?
    /// Integer value representing it's type. It's usage is currently unknown
    let type: Int?
    /// String value representing the name of the item's quality level (i.e. ft, fn, mw)
    let quality: String?
    /// String value representing the URL for the screenshot of the skin
    let img: String?
    /// Boolean value representing if the skin is StatTrak
    let isStatTrak: Bool?
    /// Integer value representing the UNIX timestamp when the trade lock is going to end, if the item has any
    let tradeLock: Int?
    /// Integer value representing the current status. It's usage is currently unknown
    let status: Int?
    /// Integer value representing the item's asset ID from it's inspect link
    let assetID: Int?
    /// String value representing the item current owner Steam Profile ID
    let steamID: String?
    /// String value representing the item's name (i.e. "AK-47 | Asiimov")
    let name: String?
    /// String value representing the item's full name (i.e. "StatTrak™ AK-47 | Asiimov (Field-Tested)")
    let fullName: String?
    /// Double value representing the item's price at CSM, before any overpays such as rare sticker of low float value
    let defaultPrice: Double?
    /// String value representing the item's rarity level
    let rarity: String?
    /// Integer value representing the amount of StatTrak kills or round MVPs registered on them item, if applicable
    let kills: Int?
    /// Boolean value indicating whether the inspected item is popular on the CSM website
    let isPopular: Bool?
    /// Boolean value indicating whether the inspected item is currently on high demand on the CSM website
    let hasHighDemand: Bool?
    /// Array of Double values, indicating the lowest and highest float value possible for the current item
    let floatRange: [Double]?
    /// Int value indicating the item's pattern ID
    let pattern: Int?
    /// CSMCase object indicating the collection the item belongs to
    let collection: CSMCase?
    /// /// CSMCase object indicating the weapon crate the item belongs to
    let csmSkinInfoCase: CSMCase?
    /// String value representing the item's inspect link
    let inspect: String?
    /// String value representing the item's placeholder image
    let steamImg: String?
    /// Integer value indicating the difference between the maximum capacity the site can hold of the current item and the currrent amout in stock
    let overstockDiff: Int?
    /// String value representing a URL to the item's preview image
    let preview: String?
    /// String value representing a URL to a 3D Preview of the item
    let preview3D: String?
    /// Integer value representing the request error code, if it fails
    let error: Int?
    
    //MARK: - Objective-C only properties
    
    /// Integer value representing the item's ID. Usually it's the item's inspect link asset parameter in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsID: NSNumber? {
        return id as NSNumber?
    }
    
    /// Integer representing the item's name ID in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsNameID: NSNumber? {
        return nameID as NSNumber?
    }
    
    /// Integer value representing ID of the game the items belongs to. For CSGO items, it will always be 730 in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsAppID: NSNumber? {
        return appID as NSNumber?
    }
    
    /// Double value item's current price at CSM in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsPrice: NSNumber? {
        return price as NSNumber?
    }
    
    /// Integer value representing it's type. It's usage is currently unknown in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsType: NSNumber? {
        return type as NSNumber?
    }
    
    /// Integer value representing the UNIX timestamp when the trade lock is going to end, if the item has any in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsTradeLock: NSNumber? {
        return tradeLock as NSNumber?
    }
    
    /// Integer value representing the current status. It's usage is currently unknown in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsStatus: NSNumber? {
        return status as NSNumber?
    }
    
    /// Integer value representing the item's asset ID from it's inspect link in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsAssetID: NSNumber? {
        return assetID as NSNumber?
    }
    
    /// Double value representing the item's price at CSM, before any overpays such as rare sticker of low float value in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsDefaultPrice: NSNumber? {
        return defaultPrice as NSNumber?
    }
    
    /// Integer value representing the amount of StatTrak kills or round MVPs registered on them item, if applicable in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsKills: NSNumber? {
        return kills as NSNumber?
    }
    
    /// Array of Double values, indicating the lowest and highest float value possible for the current item in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsFloatRange: [NSNumber]? {
        var nsFloatRange: [NSNumber]?
        guard let floatRange = floatRange else { return nil }
        floatRange.forEach {
            nsFloatRange?.append($0 as NSNumber)
        }
        return nsFloatRange
    }
    
    /// Int value indicating the item's pattern ID in NSNumber type
    @available(swift, obsoleted: 1.0)
    @objc public var nsPattern: NSNumber? {
        return pattern as NSNumber?
    }
    
    
    /// Integer value indicating the difference between the maximum capacity the site can hold of the current item and the currrent amout in stock
    @available(swift, obsoleted: 1.0)
    @objc public var nsOverstockDiff: NSNumber? {
        return overstockDiff as NSNumber?
    }
    
    /// Integer value representing the request error code, if it fails
    @available(swift, obsoleted: 1.0)
    @objc public var nsError: NSNumber? {
        return error as NSNumber?
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case nameID = "nameId"
        case appID = "appId"
        case price, float, type, quality, img, isStatTrak, tradeLock, status
        case assetID = "assetId"
        case steamID = "steamId"
        case name, fullName, defaultPrice, rarity, kills, isPopular, hasHighDemand, floatRange, pattern, collection
        case csmSkinInfoCase = "case"
        case inspect, steamImg, overstockDiff, preview
        case preview3D = "3d"
        case error
    }
    
    //MARK: - NSCoding methods
    public func encode(with coder: NSCoder) {
        coder.encode(id, forKey: CodingKeys.id.rawValue)
        coder.encode(nameID, forKey: CodingKeys.nameID.rawValue)
        coder.encode(appID, forKey: CodingKeys.appID.rawValue)
        coder.encode(price, forKey: CodingKeys.price.rawValue)
        coder.encode(float, forKey: CodingKeys.float.rawValue)
        coder.encode(type, forKey: CodingKeys.type.rawValue)
        coder.encode(quality, forKey: CodingKeys.quality.rawValue)
        coder.encode(img, forKey: CodingKeys.img.rawValue)
        coder.encode(isStatTrak, forKey: CodingKeys.isStatTrak.rawValue)
        coder.encode(tradeLock, forKey: CodingKeys.tradeLock.rawValue)
        coder.encode(status, forKey: CodingKeys.status.rawValue)
        coder.encode(assetID, forKey: CodingKeys.assetID.rawValue)
        coder.encode(steamID, forKey: CodingKeys.steamID.rawValue)
        coder.encode(name, forKey: CodingKeys.name.rawValue)
        coder.encode(fullName, forKey: CodingKeys.fullName.rawValue)
        coder.encode(defaultPrice, forKey: CodingKeys.defaultPrice.rawValue)
        coder.encode(rarity, forKey: CodingKeys.rarity.rawValue)
        coder.encode(kills, forKey: CodingKeys.kills.rawValue)
        coder.encode(isPopular, forKey: CodingKeys.isPopular.rawValue)
        coder.encode(hasHighDemand, forKey: CodingKeys.hasHighDemand.rawValue)
        coder.encode(floatRange, forKey: CodingKeys.floatRange.rawValue)
        coder.encode(pattern, forKey: CodingKeys.pattern.rawValue)
        coder.encode(collection, forKey: CodingKeys.collection.rawValue)
        coder.encode(csmSkinInfoCase, forKey: CodingKeys.csmSkinInfoCase.rawValue)
        coder.encode(inspect, forKey: CodingKeys.inspect.rawValue)
        coder.encode(steamImg, forKey: CodingKeys.steamImg.rawValue)
        coder.encode(overstockDiff, forKey: CodingKeys.overstockDiff.rawValue)
        coder.encode(preview, forKey: CodingKeys.preview.rawValue)
        coder.encode(preview3D, forKey: CodingKeys.preview3D.rawValue)
        coder.encode(error, forKey: CodingKeys.error.rawValue)
    }
    
    internal init(id: Int?, nameID: Int?, appID: Int?, price: Double?, float: String?, type: Int?, quality: String?, img: String?, isStatTrak: Bool?, tradeLock: Int?, status: Int?, assetID: Int?, steamID: String?, name: String?, fullName: String?, defaultPrice: Double?, rarity: String?, kills: Int?, isPopular: Bool?, hasHighDemand: Bool?, floatRange: [Double]?, pattern: Int?, collection: CSMCase?, csmSkinInfoCase: CSMCase?, inspect: String?, steamImg: String?, overstockDiff: Int?, preview: String?, preview3D: String?, error: Int?) {
        self.id = id
        self.nameID = nameID
        self.appID = appID
        self.price = price
        self.float = float
        self.type = type
        self.quality = quality
        self.img = img
        self.isStatTrak = isStatTrak
        self.tradeLock = tradeLock
        self.status = status
        self.assetID = assetID
        self.steamID = steamID
        self.name = name
        self.fullName = fullName
        self.defaultPrice = defaultPrice
        self.rarity = rarity
        self.kills = kills
        self.isPopular = isPopular
        self.hasHighDemand = hasHighDemand
        self.floatRange = floatRange
        self.pattern = pattern
        self.collection = collection
        self.csmSkinInfoCase = csmSkinInfoCase
        self.inspect = inspect
        self.steamImg = steamImg
        self.overstockDiff = overstockDiff
        self.preview = preview
        self.preview3D = preview3D
        self.error = error
    }
    
    required convenience public init?(coder: NSCoder) {
        let id = coder.decodeObject(forKey: CodingKeys.id.rawValue) as? Int
        let nameID = coder.decodeObject(forKey: CodingKeys.nameID.rawValue) as? Int
        let appID = coder.decodeObject(forKey: CodingKeys.appID.rawValue) as? Int
        let price = coder.decodeObject(forKey: CodingKeys.price.rawValue) as? Double
        let float = coder.decodeObject(forKey: CodingKeys.float.rawValue) as? String
        let type = coder.decodeObject(forKey: CodingKeys.type.rawValue) as? Int
        let quality = coder.decodeObject(forKey: CodingKeys.quality.rawValue) as? String
        let img = coder.decodeObject(forKey: CodingKeys.img.rawValue) as? String
        let isStatTrak = coder.decodeObject(forKey: CodingKeys.isStatTrak.rawValue) as? Bool
        let tradeLock = coder.decodeObject(forKey: CodingKeys.tradeLock.rawValue) as? Int
        let status = coder.decodeObject(forKey: CodingKeys.status.rawValue) as? Int
        let assetID = coder.decodeObject(forKey: CodingKeys.assetID.rawValue) as? Int
        let steamID = coder.decodeObject(forKey: CodingKeys.steamID.rawValue) as? String
        let name = coder.decodeObject(forKey: CodingKeys.name.rawValue) as? String
        let fullName = coder.decodeObject(forKey: CodingKeys.fullName.rawValue) as? String
        let defaultPrice = coder.decodeObject(forKey: CodingKeys.defaultPrice.rawValue) as? Double
        let rarity = coder.decodeObject(forKey: CodingKeys.rarity.rawValue) as? String
        let kills = coder.decodeObject(forKey: CodingKeys.kills.rawValue) as? Int
        let isPopular = coder.decodeObject(forKey: CodingKeys.isPopular.rawValue) as? Bool
        let hasHighDemand = coder.decodeObject(forKey: CodingKeys.hasHighDemand.rawValue) as? Bool
        let floatRange = coder.decodeObject(forKey: CodingKeys.floatRange.rawValue) as? [Double]
        let pattern = coder.decodeObject(forKey: CodingKeys.pattern.rawValue) as? Int
        let collection = coder.decodeObject(forKey: CodingKeys.collection.rawValue) as? CSMCase
        let csmSkinInfoCase = coder.decodeObject(forKey: CodingKeys.csmSkinInfoCase.rawValue) as? CSMCase
        let inspect = coder.decodeObject(forKey: CodingKeys.inspect.rawValue) as? String
        let steamImg = coder.decodeObject(forKey: CodingKeys.steamImg.rawValue) as? String
        let overstockDiff = coder.decodeObject(forKey: CodingKeys.overstockDiff.rawValue) as? Int
        let preview = coder.decodeObject(forKey: CodingKeys.preview.rawValue) as? String
        let preview3D = coder.decodeObject(forKey: CodingKeys.preview3D.rawValue) as? String
        let error = coder.decodeObject(forKey: CodingKeys.error.rawValue) as? Int
        self.init(id: id, nameID: nameID, appID: appID, price: price, float: float, type: type, quality: quality, img: img, isStatTrak: isStatTrak, tradeLock: tradeLock, status: status, assetID: assetID, steamID: steamID, name: name, fullName: fullName, defaultPrice: defaultPrice, rarity: rarity, kills: kills, isPopular: isPopular, hasHighDemand: hasHighDemand, floatRange: floatRange, pattern: pattern, collection: collection, csmSkinInfoCase: csmSkinInfoCase, inspect: inspect, steamImg: steamImg, overstockDiff: overstockDiff, preview: preview, preview3D: preview3D, error: error)
    }
}

// MARK: - Case
@objc public class CSMCase: NSObject, NSCoding, Codable {
    let name: String?
    let image: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case image = "img"
    }
    
    //MARK: - NSCoding methods
    public func encode(with coder: NSCoder) {
        coder.encode(name, forKey: CodingKeys.name.rawValue)
        coder.encode(image, forKey: CodingKeys.image.rawValue)
    }
    
    required convenience public init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: CodingKeys.image.rawValue) as? String
        let image = coder.decodeObject(forKey: CodingKeys.image.rawValue) as? String
        self.init(name: name, image: image)
    }
    
    internal init(name: String?, image: String?) {
        self.name = name
        self.image = image
    }
}
