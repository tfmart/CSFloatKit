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
        request.addValue("_gali=7459487737; _ga=GA1.2.117790977.1611311684; _gat_UA-77178353-1=1; _gid=GA1.2.867903593.1611311684; amplitude_id_c14fa5162b6e034d1c3b12854f3a26f5cs.money=eyJkZXZpY2VJZCI6IjY1ODMyYjJjLTNjYmQtNDRmZC1iMDQ0LWI4NTY2NDMwMzBjYlIiLCJ1c2VySWQiOiI3NjU2MTE5ODA2NjY5MTYzNiIsIm9wdE91dCI6ZmFsc2UsInNlc3Npb25JZCI6MTYxMTMxMjA1NDczOSwibGFzdEV2ZW50VGltZSI6MTYxMTMxMjMxNDkwNSwiZXZlbnRJZCI6NCwiaWRlbnRpZnlJZCI6MCwic2VxdWVuY2VOdW1iZXIiOjR9; _lr_hb_-uthaii%2Fcsmoney={%22heartbeat%22:1611312209224}; _ym_visorc_37320625=w; _ga_HY7CCPCD7H=GS1.1.1611312054.1.1.1611312089.25; _gcl_au=1.1.1973825668.1611311684; _lr_tabs_-uthaii%2Fcsmoney={%22sessionID%22:0%2C%22recordingID%22:%224-9faa5522-2e90-46d0-bc42-df2d8b2378ca%22%2C%22lastActivity%22:1611312089233}; new_language=pt; registered_user=true; avatar=https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/28/2800edd0d37a88e5a4f8618c4b5e5fd6ab486b3f_medium.jpg; steamid=76561198066691636; support_token=d0464df741a20a0a17225f0b201f0013d459ea843a6838d2cd2172199bd302dc; username=Tom; csgo_ses=31449f38cddc73420d19941e635dae996a38e925d53e22e0512ef3e186ad78ae; _ym_visorc=b; 2020_11_registration_pop_up_info_ver1=C; _lr_uf_-uthaii=66c823b8-9cdd-4383-8914-8ef18cf2e2e0; visitor_id=94ac950c-be19-48a9-a0b0-274d0c9178b4; _fbp=fb.1.1611311684600.1261464294; amp_9e76ea=-ht6mVQIzTyxKzTwUU5spa.Qk1iZ2RxSmtGYm83SXY1..1eskqi6cp.1eskqt75m.8.4.c; amp_c14fa5=-Ctv5uHKclqZ-Hlme4gxiq...1eskqi6h0.1eskqt75q.3.3.6; _ym_isad=1; _ym_d=1611311686; _ym_uid=1611311686202672282; __cf_bm=aae6fc14b8427af643568dc64777b5fd132baebc-1611311684-1800-ARsoxfZ/h+r7KLIyVBYTx89buioMuv7HjbkADfQeS+K5cvjq0j2TAWdR7t/yiywuc/LnMEg3QSTFTXudqhZ+6kug0XtvKqjVQhmJDVD9b3uxILig3UhKUDWmM8Z8KuKzKA==; __cfduid=d1ed17828102ad733a62b931da3809dd21611311671; __cfduid=da724950546f19d3833f523abb9de72e71611512458", forHTTPHeaderField: "Cookie")
        
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
