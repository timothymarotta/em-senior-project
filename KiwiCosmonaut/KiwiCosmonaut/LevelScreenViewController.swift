//
//  LevelScreenViewController.swift
//  KiwiCosmonaut
//
//  Created by Timothy Marotta on 4/22/21.
//

import Foundation
import UIKit
//import AVFoundation

class LevelScreenViewController: UIViewController {
    
    @IBSegueAction func levelOne(_ coder: NSCoder) -> ARViewScene? {
        let scene = ARViewScene(coder: NSCoder())
        scene?.chooseScene(levelSceneString: "one")
        return scene
    }
    
    @IBSegueAction func levelTwo(_ coder: NSCoder) -> ARViewScene? {
        let scene = ARViewScene(coder: NSCoder())
        scene?.chooseScene(levelSceneString: "two")
        return scene
    }
    
    @IBSegueAction func levelThree(_ coder: NSCoder) -> ARViewScene? {
        let scene = ARViewScene(coder: NSCoder())
        scene?.chooseScene(levelSceneString: "three")
        return scene
    }
}
