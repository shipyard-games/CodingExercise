//
//  NodeComponent.swift
//  SceneKit-Exercise-01
//
//  Created by Andreas Wedenberg on 07/01/2018.
//  Copyright © 2018 Shipyard Games Oy. All rights reserved.
//

import GameplayKit

class NodeComponent: GKComponent {
   
    var node: SCNNode!
    
    init(node: SCNNode) {
        self.node = node
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
