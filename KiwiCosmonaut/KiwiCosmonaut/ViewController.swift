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
    //var levelScene: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let boxAnchor = try! Experience.loadLevelOne()
            arView.scene.anchors.append(boxAnchor)
    }
    
//    func chooseScene(levelSceneString: String){
//        self.levelScene = levelSceneString
//        viewDidLoad()
//    }
    
}
