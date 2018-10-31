//
//  LoginViewController.swift
//  Activity 4
//
//  Created by Dania A on 31/10/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //A URL var to be intialized through the segue coming from the recording ViewController
    var receivedUrl: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func forgotPasswordIsClicked(_ sender: Any) {
        //TODO: call performSegue to fire the segue that should take you from this ViewController to AudioProcessingViewController
        performSegue(withIdentifier: "AudioProcessingSegue", sender: receivedUrl)
    }
    
    //TODO: Implement prepare for segue, and set the URL value of the recording in the AudioProcessingViewController to be the same as this one (receivedUrl).
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "AudioProcessingSegue"){
            //Before the segue is triggered and while it's being prepared, set the value of the variable in the destination VC based on the variable value available in this class
            let audioProcessingViewController =  segue.destination as! AudioProcessingViewController
            let retrievedUrl = sender as! URL // the sender is whatever we sent when we called performSegue that's why we try to cast it to URL, because that was the data type of the sender
            audioProcessingViewController.receivedUrl = retrievedUrl
            
        }
    }
    
}
