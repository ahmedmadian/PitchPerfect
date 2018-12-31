//
//  StopRecordingVC.swift
//  PitchPerfect
//
//  Created by Madian on 12/30/18.
//  Copyright © 2018 Madian. All rights reserved.
//

import UIKit

class StopRecordingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func stopRecordingButton_tapped(_ sender: UIButton){
        performSegue(withIdentifier: Constats.StopRecording_segue, sender: sender)
    }

}
