# mapbox-mapgpt-ios

MapboxMapGptNative provides MapGpt functionality.

To learn more please visit the documentation at https://docs.mapbox.com/.

### Prerequisites

Before you can download the Mapbox MapGPT SDK, you need to create a token with `DOWNLOAD:READ` scope and `MAPGPT`
Go to https://account.mapbox.com and click "Create token"

##### SPM, CocoaPods
Insert or append the following to `~/.netrc`

```bash
machine api.mapbox.com
  login mapbox
  password <YOUR TOKEN>
```

## Integration

##### Swift Package Manager

###### Using Xcode

<Add images here>


###### Using SPM Package 📱🖥💻

```swift
.package(url: "https://github.com/mapbox/mapbox-mapgpt-native-ios.git", from: "24.15.1"),
```

