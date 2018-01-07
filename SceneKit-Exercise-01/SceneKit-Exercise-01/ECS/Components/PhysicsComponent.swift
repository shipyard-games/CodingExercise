//
//  PhysicsComponent.swift
//  SceneKit-Exercise-01
//
//  Created by Andreas Wedenberg on 07/01/2018.
//  Copyright © 2018 Shipyard Games Oy. All rights reserved.
//

import GameplayKit
import SceneKit

class PhysicsComponent: GKComponent {
    
    init(node: SCNNode) {
        
        let shape = SCNPhysicsShape(geometry: node.geometry!, options:nil)
        let pyhsicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        node.physicsBody = pyhsicsBody
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

