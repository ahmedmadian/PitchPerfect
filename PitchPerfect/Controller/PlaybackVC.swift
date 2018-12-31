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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var recordedAudio: AVAudioRecorder!
    
    @IBAction func recordNewSoundButton_tapped(_ sender: UIButton) {
        performSegue(withIdentifier: Constats.RecordNewSound_segue, sender: sender)
    }

}
