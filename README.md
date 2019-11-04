# SWGOFloat

SWGOFloat is a Swift framework that provides an easy way to fetch information about a CS:GO weapon skin. All the information provided comes from [Step7750's CSGO Float API](https://github.com/Step7750/CSGOFloat).

## Installation

Currently, this package can be installed through the *[Swift Package Manager](https://swift.org/package-manager/)*

If you're running Xcode 11 or later, you can simply go to `File -> Swift Package Manager -> Add Package Dependency...` and search for `SWGOFloat` or just paste this Github page URL on the text field

If you're running an earlier version, you'll have to set up SPM on your project and add the following dependency to your `Package.swift` file:

```
dependencies: [
.package(url: "https://github.com/tfmart/SWGOFloat.git", from: "0.1.0")
]
```

## Usage

To get started, you will need to create an instance of `SWGOConfiguration` and configure it with either an item inspect link or using the S, A, D and M parameters from an inspect link. 

* Initiating with an inspect link

```
let configuration = SWGOConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561198084749846A698323590D7935523998312483177")
```

* Initiating with the S, A, D, M parameters

```
let configuration = SWGOConfiguration(inventoryParameter: nil, aParameter: "13874827217", dParameter: "4649025583329100061", marketParameter: "2608048286785948758")
```

After the setting up the configuration, create an instance of  `SWGORequester` to create a float request

```
let request = SWGORequester(configuration: config) { (skin, error) in
    
}
```

And to start the request:

```
request.start()
```

The request will either the skin fetched from the inspect link or a `ApiError`, which represents the error that occurred in the request.

## Screenshot

After fetching an instance of  `Skin` with the requester, you can it's `getScreenshotURL()` method to get an URL string which can be used to get a screenshot image, by using the [csgo.gallery service frmo CS.Deals](https://cs.deals/pt/screenshot)

```
let configuration = SWGOConfiguration(inspectLink: "steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561198084749846A698323590D7935523998312483177")
let request = SWGORequester(configuration: config) { (skin, error) in
    let screenshotURL = skin.getScreenshotURL()
    //Returns "https://csgo.gallery/steam://rungame/730/76561202255233023/+csgo_econ_action_preview%20S76561198084749846A698323590D7935523998312483177"
}

```

## Models

Documentation about the models are coming soon!

## Goals

- [x] Get skin info from CSGO Float API
- [x] Support for S, A, D and M parameters
- [x] Finish writing unit test for the request method
- [x] Get an item's screenshot with csgo.gallery
- [ ] Screenshot requester
