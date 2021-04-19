//
//  ARViewController.swift
//  Kiwi Cosmonaut
//
//  Created by Catherine Fiore on 4/19/21.
//

import Foundation
import UIKit
import RealityKit
import ARKit

class ARViewController: UIViewController{
    
    @IBOutlet var arView: ARView!
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        arView.session.delegate = self
        
        setupARView()
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(handleTap(recognizer:))))
    }
    
    //MARK: Set up Methods
    func setupARView(){
    
        arView.automaticallyConfigureSession = false
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.environmentTexturing =  .automatic
        
        // If the following line fails to compile "Value of type 'ARView' has no member 'session'"
           // You need to select a Real Device or Generic iOS Device and not a simulator
           arView.session.run(configuration)
    }
    
    //MARK: Object Placement
    @objc
    func handleTap (recognizer: UITapGestureRecognizer){
        let location = recognizer.location(in: arView)
        

        let results = arView.raycast(from:location, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let firstResult = results.first{
            let anchor = ARAnchor (name: "Beacon", transform: firstResult.worldTransform)
            arView.session.add(anchor: anchor)
        } else{
            print("Object placement failed. Couldnt find surface.")
        }
    }
    func placeObject(named entityName:String, for anchor: ARAnchor){
        let entity = try! ModelEntity.loadModel(named: entityName)
        //might need to cfreate a optional incase the model does not exist
        
        entity.generateCollisionShapes(recursive: true)
        arView.installGestures([.rotation], for: entity)
        
        
        let anchorEntity = AnchorEntity(anchor: anchor)
        anchorEntity.addChild(entity)
        arView.scene.addAnchor(anchorEntity)
    }
}

extension ARViewController: ARSessionDelegate {
    func session(_ session:ARSession, didAdd anchors: [ARAnchor]){
        for anchor in anchors {
            if let anchorName = anchor.name, anchorName == "Beacon" {
                placeObject(named: anchorName, for:anchor)
            }
        }
    }
}
