//
//  ViewController.swift
//  here
//
//  Created by Bruce Bookman on 8/7/18.
//  Copyright © 2018 Bruce Bookman. All rights reserved.
//

import UIKit
import CoreLocation
import SCSDKCreativeKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        button.setTitle("Send to Snapchat", for: .normal)
        button.setTitleColor(self.view.tintColor, for: .normal)
        
        self.view.addSubview(button)
        button.center = self.view.center
        button.addTarget(self, action: #selector(self.send), for: .touchUpInside)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func createMapImage() -> UIImage {
        struct here {
            static var id = "EfkqfZ62TU79j7VwnPsW"
            static var code = "tf4pDMwFS1IEEs5sCeEaIA"
        }
        
        let lat = locationManager.location!.coordinate.latitude
        let long = locationManager.location!.coordinate.longitude
        
        //Map Image API parameters
        let zoom = 14 //Zoom level
        let quality = 100 //Image quality
        let markerType = 1 //Marker type
        let mapStyle = 5 //Map style, currently set to normal day grey
        let endpoint = URL(string: "https://image.maps.api.here.com/mia/1.6/mapview?app_id=\(here.id)&app_code=\(here.code)&poi=\(lat),\(long)&z=\(zoom)&q=\(quality)&poithm=\(markerType)&t=\(mapStyle)")
        let response = try? Data(contentsOf: endpoint!)
        let mapImage = UIImage(data: response!)
        return mapImage!
    }
    
    @objc func send() {
        let img = createMapImage()
        let sticker = SCSDKSnapSticker(stickerImage: img)
        let snap = SCSDKNoSnapContent()
        snap.sticker = sticker
        snap.attachmentUrl = "https://developer.here.com"
        
        let api = SCSDKSnapAPI(content: snap)
        api.startSnapping { (error) in }
    }
}


