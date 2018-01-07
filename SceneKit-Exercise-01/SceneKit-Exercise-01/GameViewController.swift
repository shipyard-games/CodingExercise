//
//  GameViewController.swift
//  SceneKit-Exercise-01
//
//  Created by Teemu Harju on 06/01/2018.
//  Copyright © 2018 Shipyard Games Oy. All rights reserved.
//

import GameplayKit
import SceneKit
import QuartzCore

class GameViewController: NSViewController, SCNSceneRendererDelegate {
    
    var entityManager: EntityManager!
    var lastUpdateTimeInterval: TimeInterval = 0
    let spawnInterval: TimeInterval = 2
    var spawnTime: TimeInterval = 0
    var spawnPosition = SCNVector3(0,4,0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/MainScene.scn")!
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        scnView.delegate = self
        
        // set the scene to the view
        scnView.scene = scene
        
        entityManager = EntityManager(scene: scene)
        let moveSystem = GKComponentSystem(componentClass: MoveComponent.self)
        entityManager.add(moveSystem)
        
        // Add a click gesture recognizer
        let clickGesture = NSClickGestureRecognizer(target: self, action: #selector(handleClick(_:)))
        var gestureRecognizers = scnView.gestureRecognizers
        gestureRecognizers.insert(clickGesture, at: 0)
        scnView.gestureRecognizers = gestureRecognizers
        
        spawnTime = spawnInterval
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        let deltaTime = time - lastUpdateTimeInterval
        lastUpdateTimeInterval = time
        
        spawnTime += deltaTime
        if spawnTime > spawnInterval {
            
            spawnTime = 0
            spawnBox(spawnPosition)
        }
        
        entityManager.update(deltaTime)
    }
    
    func spawnBox(_ position: SCNVector3) {
        
        // Create a box entity
        let boxEntity = GKEntity()
        
        // Add a box component to the box entity
        // The BoxComponent creates a box node
        let boxComponent = BoxComponent(width: 1, height: 1, length: 1, boxColor: NSColor.red)
        boxEntity.addComponent(boxComponent)
        
        let node = boxComponent.node
        node.position = position
        node.entity = boxEntity
        
        // Add a NodeComponent so that the EntityManager adds the
        // box node to the scene
        let nodeComponent = NodeComponent(node: node)
        boxEntity.addComponent(nodeComponent)
        
        // Add a MoveComponent to move the box around
        let moveComponent = MoveComponent(node: node)
        boxEntity.addComponent(moveComponent)
        
        // Add a physics component to make the box fall down
        let physicsComponent = PhysicsComponent(node: node)
        boxEntity.addComponent(physicsComponent)
        
        entityManager.add(boxEntity)
    }
    
    @objc
    func handleClick(_ gestureRecognizer: NSGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are clicked
        let p = gestureRecognizer.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result = hitResults[0]
            
            // get its material
            let node = result.node
            let material = node.geometry!.firstMaterial!

            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                
                self.entityManager.remove(node.entity!)
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = NSColor.red
            
            
            
            SCNTransaction.commit()
        }
    }
}
