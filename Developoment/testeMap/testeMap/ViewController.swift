//
//  ViewController.swift
//  testeMap
//
//  Created by user on 26/08/14.
//  Copyright (c) 2014 User. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapViewApp: MKMapView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapViewApp.showsUserLocation = true
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 

}

