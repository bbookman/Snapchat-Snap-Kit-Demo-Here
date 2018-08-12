# Snapchat-Snap-Kit-Demo-Here
iOS App in Swift uses Here Geolocation to make a map that can be added to a snap in Snapchat

# Instructions
## From Here
[Here Maps Snap Kit](https://developer.here.com/blog/here-maps-snap-kit)

## Snapchat Developer Portal

1. Sign up for an account on the [Snapchat Dev Portal](https://kit.snapchat.com/)
2. Note / copy the value in **Development App Info** > **OAUTH2 CLIENT ID**

## Info.plist

Edit the **Info.plist** and add or modify as described below:

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

## Resources
* [Snapchat Snap Kit DIY Docs](https://github.com/bbookman/Snapchat-Snapkit-DIY-Docs)
* [Snapchat Snap Kit Official Documentation](https://docs.snapchat.com/docs/)
* [Here Maps Snap Kit](https://developer.here.com/blog/here-maps-snap-kit)
