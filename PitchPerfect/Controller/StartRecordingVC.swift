//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Madian on 12/30/18.
//  Copyright © 2018 Madian. All rights reserved.
//

import UIKit
import AVFoundation

class StartRecordingVC: UIViewController, AVAudioRecorderDelegate {

    //Outlets
    @IBOutlet weak var RecordingLabel:UILabel!
    @IBOutlet weak var RecordingButton: UIButton!
    
    enum ButtonState{
        case record
        case pasue
    }
    var audioRecorder: AVAudioRecorder!
    var buttonSate: ButtonState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonSate = .record
    }
    
    //Actions
    
    @IBAction func startRecordingButton_tapped(_ sender: UIButton){
        if buttonSate == .record {
            RecordingButton.setImage(UIImage(named: "Stop"), for: .normal)
            RecordingLabel.text = "Tap to stop recording"
            buttonSate = .pasue
            startRecording()
        } else{
            stopRecording()
            //performSegue(withIdentifier: Constats.Playback_segue, sender: sender)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let playbackVC = segue.destination as? PlaybackVC {
            playbackVC.recordedAudioURL = sender as? URL
        }
    }
    
    
    func startRecording(){
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath!)
        
        let session  = AVAudioSession.sharedInstance()
        try! session.setCategory( .playAndRecord, mode: .default, options: .defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    func stopRecording() {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: Constats.Playback_segue, sender: audioRecorder.url)
        } else {
            print("Recording was not successful")
        }
    }

}

