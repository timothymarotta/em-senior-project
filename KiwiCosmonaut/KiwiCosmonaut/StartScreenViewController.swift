//
//  StartScreenViewController.swift
//  KiwiCosmonaut
//
//  Created by Timothy Marotta on 4/20/21.
//

import Foundation
import UIKit
import AVFoundation

class StartScreenViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var creditsButton: UIButton!
    
    @IBAction func startButtonPressed(_ sender: Any) {
        player.stop()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "game_music_1", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
            //ERROR
        }
        player.play()
        player.numberOfLoops = -1
    }
    
    
}
