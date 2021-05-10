//
//  ARLevelThree.swift
//  KiwiCosmonaut
//
//  Created by Catherine Fiore on 5/9/21.
//


import Foundation
import UIKit
import RealityKit

class ARLevelThree: UIViewController {
    
    

    @IBOutlet weak var arView: ARView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxAnchor = try! Experience.loadLevelThree()
            arView.scene.anchors.append(boxAnchor)
    }
    
    
}
