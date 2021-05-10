//
//  ARLevelOne.swift
//  KiwiCosmonaut
//
//  Created by Catherine Fiore on 5/9/21.
//

import Foundation
import UIKit
import RealityKit

class ARLevelOne: UIViewController {
    

    @IBOutlet weak var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let boxAnchor = try! Experience.loadLevelOne()
            arView.scene.anchors.append(boxAnchor)
        boxAnchor.actions.notifyAction.onAction = { _in
            levelOneEndTrigger()
        }

    }
    
    @IBAction func levelOneEndTrigger(){
        let isLevelFinished: Bool = false
        
        while(isLevelFinished == false){
            let helmetPos = arView.scene.findEntity(named: "helmet")?.position
            print(helmetPos!)
        }
    }
}
