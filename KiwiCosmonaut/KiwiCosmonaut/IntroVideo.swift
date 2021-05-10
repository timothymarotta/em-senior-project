//
//  IntroVideo.swift
//  KiwiCosmonaut
//
//  Created by Catherine Fiore on 5/10/21.
//


import Foundation
import UIKit
import AVFoundation
import AVKit

class IntroVideo: AVPlayerViewController {
    


     override func viewDidLoad() {
            super.viewDidLoad()
        }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "kiwiCosmoFinalCopy", ofType: "mp4")!))
        self.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        present(self, animated: true)

    }

//    @IBAction func VideoToLevels(_ sender: Any) {
//        
//        self.performSegue(withIdentifier: "VideoToLevel", sender: self)
//    }
    
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
           self.dismiss(animated: true)
        //self.performSegue(withIdentifier: "VideoToLevel", sender: self)
    }
    
}
