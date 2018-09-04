//
//  RiderVC.swift
//  rider
//
//  Created by gustavo gomez on 04/09/18.
//  Copyright © 2018 erickArciniega. All rights reserved.
//

import UIKit
import MapKit

class RiderVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var myMap: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func callUber(_ sender: Any) {
    }
    
    
    @IBAction func logout(_ sender: Any) {
        
        if AuthProvider.Instance.logOut(){
            dismiss(animated: true, completion: nil);
        }else{
            //problems with the logout
            
            alertTheUser(title: "Could not Logout", message: "We could not logout at the moment, please try again, later");
        }
        
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil);
    }
    
    
}//class
