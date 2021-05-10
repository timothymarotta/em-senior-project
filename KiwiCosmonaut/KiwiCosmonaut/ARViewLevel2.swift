//
//  ARViewLevel2.swift
//  KiwiCosmonaut
//
//  Created by Catherine Fiore on 5/9/21.
//

import Foundation
import UIKit
import RealityKit

class ARScenelevel2: UIViewController {
    
    
    @IBOutlet weak var arView: ARView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxAnchor = try! Experience.loadLevelTwo()
            arView.scene.anchors.append(boxAnchor)
    }
    
//    func chooseScene(levelSceneString: String){
//        self.levelScene = levelSceneString
//        viewDidLoad()
//    }
    
}
