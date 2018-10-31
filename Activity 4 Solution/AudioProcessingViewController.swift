//
//  AudioProcessingViewController.swift
//  PitchPerfectProject
//
//  Created by Dania A on 08/07/2018.
//  Copyright © 2018 Udacity. All rights reserved.
// I wrote some of the code in this class by myself and some other parts are taken from Udacity's PitchPerfect project such as calling setupAudio, stopButtonPressed function, stopAudio function, and configureUI function.

import UIKit
import AVFoundation

class AudioProcessingViewController: UIViewController {
    
    //TODO: Add a UIViewController to the storyboard and connect it to this class.
    //(This is solved on the storyboard)
    
    //TODO: Use StackViews and add buttons for different pitches in the correct way so they look like a grid of two columns (as in the provided screenshot)
    //(This is solved on the storyboard)
    
    //TODO: Add a tag for each of the pitch buttons, so you can use a single IBAction for all of them and differentiate the action to be taken using the tag. Please set the tag values equal to what you can see in ButtonTag enum below, so you don't need to change the code given to you here.
    //(This is solved on the storyboard)
    
    //TODO: Add the stop button to the storyboard using the correct constraints to have it look like the one in the screenshot.
    //(This is solved on the storyboard)
    
    var receivedUrl: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    //TODO: Create IBOutlets for each pitch button and for the stop button. Then, connect the IBOutlets with their corresponding buttons in the storyboard.
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    enum ButtonTag: Int {
        case slow = 0, fast, highPitch, lowPitch, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    
    @IBAction func processAudio (_ sender: UIButton){
        switch (ButtonTag (rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
        
    }
    
    //TODO: Connect this IBAction to the stop button
    @IBAction func stopButtonPressed(_ sender: UIButton){
        stopAudio()
    }
    
    
}

