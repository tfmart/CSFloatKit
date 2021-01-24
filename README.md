# CSGOFloatKit

CSGOFloatKit is a Swift framework that provides an easy way to fetch information about a CS:GO weapon skin. All the information provided comes from [Step7750's CSGO Float API](https://github.com/Step7750/CSGOFloat).

## Installation

Currently, this package can be installed through the *[Swift Package Manager](https://swift.org/package-manager/)*

If you're running Xcode 11 or later, you can simply go to `File -> Swift Package Manager -> Add Package Dependency...` and search for `CSGOFloatKit` or just paste this Github page URL on the text field

If you're running an earlier version, you'll have to set up SPM on your project and add the following dependency to your `Package.swift` file:

```
dependencies: [
.package(url: "https://github.com/tfmart/CSGOFloatKit.git", from: "0.1.0")
]
```

## Usage

To get started, you will need to create an instance of `CSGOFloatConfiguration` and configure it with either an item inspect link or using the S, A, D and M parameters from an inspect link. 

* Initiating with an inspect link

```
let configuration = CSGOFloatConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561198084749846A698323590D7935523998312483177")
```

* Initiating with the S, A, D, M parameters

```
let configuration = CSGOFloatConfiguration(inventoryParameter: nil, assetParameter: "13874827217", dParameter: "4649025583329100061", marketParameter: "2608048286785948758")
```

After the setting up the configuration, create an instance of  `SWGORequester` to create a float request

```
let request = CSGOFloatRequester(configuration: config) { (skin, error) in
    
}
```

And to start the request:

```
request.start()
```

The request will either the skin fetched from the inspect link or a `ApiError`, which represents the error that occurred in the request.

## Screenshot

After fetching an instance of  `Skin` with the requester, you can it's `getScreenshotURL()` method to get an URL string which can be used to get a screenshot image, by using the [CS.Deals' csgo.gallery screenshot service](https://cs.deals/pt/screenshot)

```
let configuration = CSGOFloatConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561198084749846A698323590D7935523998312483177")
let request = SWGORequester(configuration: config) { (skin, error) in
    let screenshotURL = skin.getScreenshotURL()
    //Returns "https://csgo.gallery/steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561198084749846A698323590D7935523998312483177"
}

```

From version 0.3 upwards, it's also possible to fetch [CS.Money](https://cs.money) screenshots and 3D models, just by using the item's inspect link or an instance of a `Skin` object:

```
let configuration = CSMConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561199043158336A20517916623D14133434752320963923")
let request = CSMRequester(configuration: config, completion: { (fetchedScreenshot, error) in
    // URL for the skin's screenshot
    let screenshotURL = fetchedScreenshot.imageURL
    // URL for the skin's preview screenshot
    let previewURL = fetchedScreenshot.previewURL
    // URL for the skin's 3D preview
    let preview3DURL = fetchedScreenshot.preview3D
})
request.start()
```

## Models

Documentation about the models are coming soon!

## Goals

- [x] Get skin info from CSGO Float API
- [x] Support for S, A, D and M parameters
- [x] Finish writing unit test for the request method
- [x] Get an item's screenshot with csgo.gallery
- [x] Screenshot requester
- [ ] Fetch images for non-marketable stickers applied to items
