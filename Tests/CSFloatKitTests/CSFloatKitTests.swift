import XCTest
@testable import CSFloatKit

final class CSFloatKitTests: XCTestCase {
    
    func testWithInspectLink() {
        let exp = expectation(description: "InspectLink")
        var skin: Skin?
        let config = CSFloatConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20M2073282427452891333A17897386024D5335550430047430373")
        let request = CSFloatRequester(configuration: config) { (fetchedSkin, error) in
            XCTAssertNotNil(fetchedSkin)
            guard let actualSkin = fetchedSkin else { return }
            skin = actualSkin
            exp.fulfill()
        }
        request.start()
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(skin)
        }
    }
    
    func testWithSADMParameters() {
        let exp = expectation(description: "Parameters")
        var skin: Skin?
        let config = CSFloatConfiguration(inventoryParameter: nil, assetParameter: "13874827217", dParameter: "4649025583329100061", marketParameter: "2608048286785948758")
        let request = CSFloatRequester(configuration: config) { (fetchedSkin, error) in
            XCTAssertNotNil(fetchedSkin)
            guard let actualSkin = fetchedSkin else { return }
            skin = actualSkin
            exp.fulfill()
        }
        request.start()
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(skin)
        }
    }
    
    func testCSMScreenshot() {
        let exp = expectation(description: "CSM Screenshot")
        var screenshot: CSMScreenshot?
        guard let config = CSMConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561199043158336A20517916623D14133434752320963923") else {
            XCTFail("Invalid inspect link for CSM Service")
            return
        }
        let request = CSMRequester(configuration: config, completion: { (fetchedScreenshot, error) in
            XCTAssertEqual(error, .noError)
            XCTAssertNotNil(fetchedScreenshot)
            guard let actualScreenshot = fetchedScreenshot else { return }
            screenshot = actualScreenshot
            exp.fulfill()
        })
        request.start()
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(screenshot)
        }
    }
    
    func testPreview3D() {
        let exp = expectation(description: "CSM Screenshot")
        var previewURL: String?
        guard let config = CSMConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561199043158336A20517916623D14133434752320963923") else {
            XCTFail("Invalid inspect link for CSM Service")
            return
        }
        let request = CSMRequester(configuration: config, completion: { (fetchedScreenshot, error) in
            XCTAssertEqual(error, .noError)
            XCTAssertNotNil(fetchedScreenshot)
            guard let actualScreenshot = fetchedScreenshot else { return }
            previewURL = actualScreenshot.preview3D
            XCTAssertEqual(previewURL, "https://3d.cs.money/item/TWXUyFZ")
            exp.fulfill()
        })
        request.start()
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(previewURL)
        }
    }
}
