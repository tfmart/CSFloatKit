import XCTest
@testable import SWGOFloat

final class SWGOFloatTests: XCTestCase {
    
    func testWithInspectLink() {
        let exp = expectation(description: "InspectLink")
        var skin: Skin?
        let config = FloatConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561198084749846A698323590D7935523998312483177")
        let request = FloatRequester(configuration: config) { (fetchedSkin, error) in
            XCTAssertNotNil(fetchedSkin)
            guard let actualSkin = fetchedSkin else { return }
            skin = actualSkin
            exp.fulfill()
        }
        request.start()
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(skin?.error)
        }
    }
    
    func testWithSADMParameters() {
        let exp = expectation(description: "Parameters")
        var skin: Skin?
        let config = FloatConfiguration(inventoryParameter: nil, aParameter: "13874827217", dParameter: "4649025583329100061", marketParameter: "2608048286785948758")
        let request = FloatRequester(configuration: config) { (fetchedSkin, error) in
            XCTAssertNotNil(fetchedSkin)
            guard let actualSkin = fetchedSkin else { return }
            skin = actualSkin
            exp.fulfill()
        }
        request.start()
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(skin?.error)
        }
    }
}
