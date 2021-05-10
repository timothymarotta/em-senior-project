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
    
  
    let vc = AVPlayerViewController()
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        }
    
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
     }


    @IBAction func playVideo(_ sender: Any) {
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "kiwiCosmoFinalCopy", ofType: "mp4")!))

        vc.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: vc.player?.currentItem)

        self.present(vc, animated: true) {
            self.vc.player!.play()
              }

    }

    @objc func playerDidFinishPlaying(note: NSNotification) {
          self.vc.dismiss(animated: true)
        //super.viewDidLoad()
      }
  }
    



