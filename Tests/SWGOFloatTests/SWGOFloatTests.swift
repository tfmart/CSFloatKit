import XCTest
@testable import SWGOFloat

final class SWGOFloatTests: XCTestCase {
    
    func testWithInspectLink() {
        let exp = expectation(description: "InspectLink")
        var skin: Skin?
        let config = SWGOConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20M2073282427452891333A17897386024D5335550430047430373")
        let request = SWGORequester(configuration: config) { (fetchedSkin, error) in
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
        let config = SWGOConfiguration(inventoryParameter: nil, aParameter: "13874827217", dParameter: "4649025583329100061", marketParameter: "2608048286785948758")
        let request = SWGORequester(configuration: config) { (fetchedSkin, error) in
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
}
