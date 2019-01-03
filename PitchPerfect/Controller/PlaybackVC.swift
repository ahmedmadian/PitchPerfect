//
//  PlaybackVC.swift
//  +
//
//  Created by Madian on 12/31/18.
//  Copyright © 2018 Madian. All rights reserved.
//

import UIKit
import AVFoundation


class PlaybackVC: UIViewController {

    //Outlets
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton){
       
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopbuttonPressed(_ sender: UIButton) {
        stopAudio()
    }
    @IBAction func recordNewSoundButton_tapped(_ sender: UIButton) {
        performSegue(withIdentifier: Constats.RecordNewSound_segue, sender: sender)
    }

}
