//
//  ViewController.swift
//  Kiwi Cosmonaut
//
//  Created by Catherine Fiore on 4/19/21.
//

import Foundation
import UIKit
import RealityKit
import ARKit


class ViewController: UIViewController{
    
    @IBOutlet var arView: ARView!
   
    
    //var levelAnchor: Experience.LevelZero?
    
    //can also be viewDidAppear
    override func viewDidAppear(_ animated: Bool){
            super.viewDidAppear(animated)
        
            
            arView.session.delegate = self
            setupARView()
            
            arView.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(handleTap(recognizer:))))
        
        //this was just the built in code
            //let levelAnchor = try! Experience.loadLevelZero()
            //arView.scene.anchors.append(levelAnchor)
            //self.levelAnchor = levelAnchor
        
    }
    
    //MARK: Set up Methods
    
    func setupARView(){
        //overrides the automatic set up
        arView.automaticallyConfigureSession = false
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.environmentTexturing =  .automatic
        arView.session.run(configuration)
    }
    
    //MARK: Object Placement
    @objc func handleTap (recognizer: UITapGestureRecognizer){
        let location = recognizer.location(in: arView)
        

        let results = arView.raycast(from:location, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let firstResult = results.first{
            let anchor = ARAnchor (name: "beacon", transform: firstResult.worldTransform)
            arView.session.add(anchor: anchor)
        } else{
            print("Object placement failed. Couldnt find surface.")
        }
    }
    
    func placeObject(named entityName:String, for anchor: ARAnchor){
        
        //sets level zero for the scene entity. 
        let entity = try! Experience.loadLevelZero()
    
        //allows you to move it into the scene
        entity.generateCollisionShapes(recursive: true)
        //gesture control for rotation
        arView.installGestures([.rotation,.translation], for: entity as! HasCollision)
        
        //creates a enchor entity with the location we created earlier
        let anchorEntity = AnchorEntity(anchor: anchor)
        anchorEntity.addChild(entity)
        arView.scene.addAnchor(anchorEntity)
    }
    
}

extension ViewController: ARSessionDelegate {
    public func session(_ session:ARSession, didAdd anchors: [ARAnchor]){
        for anchor in anchors {
            if let anchorName = anchor.name, anchorName == "beacon" {
                placeObject(named: anchorName, for:anchor)
            }
        }
    }
}

