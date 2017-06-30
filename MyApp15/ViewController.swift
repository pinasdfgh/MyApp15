//
//  ViewController.swift
//  MyApp15
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var webvc: UIWebView!
    let lmgr = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.first{
            let lat = loc.coordinate.latitude
            let lng = loc.coordinate.longitude
            let h = loc.altitude
            print("\(lat),\(lng),\(h)")
            
            webvc.stringByEvaluatingJavaScript(from: "moveToKD(lat,lng)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "map", withExtension: "html")
        let req = URLRequest(url: url!)
        
        webvc.loadRequest(req)
        lmgr.requestAlwaysAuthorization()
        lmgr.delegate = self
        
        lmgr.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

