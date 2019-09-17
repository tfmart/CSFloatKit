import XCTest
@testable import SWGOFloat

final class SWGOFloatTests: XCTestCase {
    
    func testWithInspectLink() {
        let config = FloatController(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561198084749846A698323590D7935523998312483177")
        
        config.getWeaponInfo { response in
            switch response {
            case .success(let skin):
                XCTAssert(skin.iteminfo?.fullItemName == "Silver Operation Breakout Coin")
            case .failure( _):
                XCTFail()
            }
        }
    }
    
    func testWithSADMParameters() {
        let config = FloatController(inventoryParameter: nil, aParameter: "13874827217", dParameter: "4649025583329100061", marketParameter: "2608048286785948758")
        
        config.getWeaponInfo { response in
            switch response {
            case .success(let skin):
                XCTAssert(skin.iteminfo?.name == "Redline")
            case .failure( _):
                XCTFail()
            }
        }
    }
}
