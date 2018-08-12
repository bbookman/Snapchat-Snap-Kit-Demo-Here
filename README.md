# Snapchat-Snap-Kit-Demo-Here
iOS App in Swift uses Here Geolocation to make a map sticker that can be added to a snap in Snapchat

Inspired by [Location-aware Snapchat stickers with Snap Kit + HERE](https://developer.here.com/blog/here-maps-snap-kit)

# Instructions

You can find great instructions in the post [Location-aware Snapchat stickers with Snap Kit + HERE](https://developer.here.com/blog/here-maps-snap-kit), or follow along below - or do both

**Note:** If following the instructions in the Here post, an easy to miss detail is using the **JavaScript/REST** activation rather than the iOS SDK.  Use **JavaScript/REST**

## Snapchat Developer Portal

1. Sign up for an account on the [Snapchat Dev Portal](https://kit.snapchat.com/)
2. Note / copy the value in **Development App Info** > **OAUTH2 CLIENT ID**

## Get Snapchat Snap Kit using Cocoapods

The Podfile in this repository already contains what is required. [See this Snapchat doc](https://docs.snapchat.com/docs/downloads/).  Just run **pod install**

## Info.plist

Edit the **Info.plist** and add or modify as described below:

Don't forget to remove all of the comments in the info.plist

```xml
    <key>SCSDKClientId</key>
    <string><OAUTH2 CLIENT ID></string> // See the step above in Snapchat Developer Protal
```

The SCSDKRedirectUrl and the CFBundleURLSchemes are related, as well as the value to place in the Snapchat Developer Portal.

The values can be completely made up. As long as the values match and are unique (see below). For example, if my app is named This Crazy App I could set these values:
1.  In the Snap Kit Portal, add at least one url to **Redirect URLs**, in the example this would be **_thiscrazyapp://myapp_**
2. Add the **CFBundleURLSchemes** in the info.plist, in the example this would be **_thiscrazyapp_**
3. Add the **SCSDKRedirectUrl** in th info.plist, in the example this would be **_thiscrazyapp://myapp_**

[For more information, see Snapchat Snapkit DIY Docs](https://github.com/bbookman/Snapchat-Snap-Kit-DIY-Docs/wiki/Login-Kit)

```xml
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>snapchat</string> //add this
    </array>
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>thiscrazyapp</string> //Should be unique to your app
            </array>
            <key>CFBundleURLName</key>
            <string></string>
        </dict>
    </array>
    <key>SCSDKRedirectUrl</key>
        <string>thiscrazyapp://myapp</string> //must match what you add in snapchat dev portal
```
Set user option for allow location
```xml
<key>NSLocationWhenInUseUsageDescription</key>
    <string>Location will only be used when app is open</string>
    <key>NSLocationUsageDescription</key>
    <string>Location is used to create location relevant stickers</string>
```

The info.plist in this repository is complete and only requires the unique values from your Snap Kit Developer Portal values:

* OAUTH2 CLIENT ID (Development)
* Redirect URLs

## Sign up for Here SDK
Simple.  Go to [developer.here.com](https://developer.here.com/) and get a free account.  When you get to the point of choosing your SDK, choose **JavaScript/REST**

Make note of the **App ID** and the **App Code** that are displayed after activation.

In the ViewController.swift file, you will see the code below.  Replace

```swift
func createMapImage() -> UIImage {
        struct here {
            static var id = "YOUR-APP-ID"
            static var code = "YOUR-APP-CODE"
        }
```

## Running the App

[Run it on a physical phone](https://www.utest.com/articles/how-to-install-ios-apps-via-xcode-on-a-mac) so you can use the camera

## Resources
* [Snapchat Snap Kit DIY Docs](https://github.com/bbookman/Snapchat-Snapkit-DIY-Docs)
* [Snapchat Snap Kit Official Documentation](https://docs.snapchat.com/docs/)
* [Location-aware Snapchat stickers with Snap Kit + HERE](https://developer.here.com/blog/here-maps-snap-kit)
