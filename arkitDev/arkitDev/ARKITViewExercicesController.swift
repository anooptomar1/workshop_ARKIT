//
//  ARKITViewExercicesController.swift
//  arkitDev
//
//  Created by ibrahim on 06/12/2017.
//  Copyright © 2017 arkitWorkshop. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARKITViewExercicesController: UIViewController, ARSCNViewDelegate {
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    func addCoachBoard() -> SCNNode {
        //print(coachBoardScene.rootNode.childNodes)
        
        // Import my 3D Object
        let coachBoardScene = SCNScene(named: "art.scnassets/Mec_Pompe/coach_Mec_Pompe/coach_Mec_Pompe.scn")!
        
        let nodeObject = SCNNode()
        
        for child in coachBoardScene.rootNode.childNodes {
            nodeObject.addChildNode(child)
        }
        
        return nodeObject
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // This visualization covers only detected planes.
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // Create a SceneKit plane to visualize the node using its position and extent.
        //let plane = SCNSphere(radius: 0.1)
        //let planeNode = SCNNode(geometry: plane)
        //planeNode.position = SCNVector3Make(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        //node.addChildNode(planeNode)
        
        let dude = addCoachBoard()
        
        //dude.position = SCNVector3(0.0, 0.0, 0.2)
        
        dude.position = SCNVector3Make(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        //dude.scale = SCNVector3(0.01,0.01,0.01)
        //addCoachBoard()
        
        //body!.position = SCNVector3Make(planeAnchor.center.x, 0, planeAnchor.center.z)
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        // Set the scene to the view
        //sceneView.scene = scene
        
        //node.addChildNode(body!)
        
        node.addChildNode(dude)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
