//
//  LevelScreenViewController.swift
//  KiwiCosmonaut
//
//  Created by Timothy Marotta on 4/22/21.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class LevelScreenViewController: UIViewController {
    
    //var player:AVPlayer = AVPlayer()
    let vc = AVPlayerViewController()
     
     override func viewDidLoad() {
            super.viewDidLoad()
       
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "kiwiCosmoFinalCopy", ofType: "mp4")!))
//        let layer = AVPlayerLayer(player: player)
//        layer.frame = view.bounds
//        layer.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(layer)
//        //player.volume = 0
//        player.play()

        vc.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: vc.player?.currentItem)
        present(vc, animated: true)
    }
      
    @objc func playerDidFinishPlaying(note: NSNotification) {
           self.vc.dismiss(animated: true)
       }
    
}
