//
//  ViewController.swift
//  ARKITBack
//
//  Created by Adrien Jourdier on 07/12/2017.
//  Copyright © 2017 arkitWorkshop. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
     var body:SCNNode?
    
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
    
    // Function which import the 3D object and which create the scene
    func addCoachBoard() {
        // Import my 3D Object
        guard let coachBoardScene = SCNScene(named: "art.scnassets/coach_Mec_Pompe.scn") else {
            return
        }
        
        //print(coachBoardScene.rootNode.childNodes)
        
        body = coachBoardScene.rootNode
        
        body!.position = SCNVector3(x: 0.0, y: 0.5, z: -0.2)
        
        // Rotate the body to 90 degrees
        //body!.transform = SCNMatrix4MakeRotation(Float(Double.pi / 2.0), 1.0, 0.0, 0.0);
        
        sceneView.scene.rootNode.addChildNode(body!)
        
        // Récupérer les coordonnées géométriques du sol.
        // Le sol est une ancre
        
        // Faire un truc du style:
        // maVariable.position = SCNVector3(x: 0, y: 0, z: 0)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // This visualization covers only detected planes.
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // Create a SceneKit plane to visualize the node using its position and extent.
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3Make(planeAnchor.center.x, 0, planeAnchor.center.z)
        
        addCoachBoard()
        
        body!.position = SCNVector3Make(planeAnchor.center.x, 0, planeAnchor.center.z)
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        //sceneView.scene = scene
        
        node.addChildNode(body!)
        node.addChildNode(planeNode)
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
