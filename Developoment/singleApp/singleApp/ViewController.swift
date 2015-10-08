//
//  ViewController.swift
//  singleApp
//
//  Created by user on 26/08/14.
//  Copyright (c) 2014 User. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController,MKMapViewDelegate {
    
    var __location : CLLocationManager!
    @IBOutlet weak var mapView: MKMapView!
    
    var socket: SocketIO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        __location = CLLocationManager()
        __location.requestWhenInUseAuthorization()
        self.mapView.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

