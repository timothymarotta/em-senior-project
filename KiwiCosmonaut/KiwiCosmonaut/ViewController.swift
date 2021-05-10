//
//  ViewController.swift
//  KiwiCosmonaut
//
//  Created by Timothy Marotta on 4/20/21.
//

import UIKit
import RealityKit

enum levelSceneError: Error {
    case levelSceneNotFound
}

class ARViewScene: UIViewController {
    
    @IBOutlet var arView: ARView!
    var levelScene: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        if (self.levelScene == "one"){
            let boxAnchor = try! Experience.loadLevelOne()
            arView.scene.anchors.append(boxAnchor)
        } else if (self.levelScene == "two"){
            let boxAnchor = try! Experience.loadLevelTwo()
            arView.scene.anchors.append(boxAnchor)
        } else if (self.levelScene == "three"){
            let boxAnchor = try! Experience.loadLevelThree()
            arView.scene.anchors.append(boxAnchor)
        }
        
    }
    
    func chooseScene(levelSceneString: String){
        self.levelScene = levelSceneString
        viewDidLoad()
    }
    
}
