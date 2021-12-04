//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        //Set to half opaque when key pressed
        sender.alpha = 0.5
        playSound(soundName: sender.currentTitle!)
        //Delay restoring full opacity for .2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
              //Set back to full opacity
              sender.alpha = 1.0
          }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

