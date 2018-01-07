//
//  BoxComponent.swift
//  SceneKit-Exercise-01
//
//  Created by Andreas Wedenberg on 07/01/2018.
//  Copyright © 2018 Shipyard Games Oy. All rights reserved.
//

import GameplayKit
import SceneKit

class BoxComponent: GKComponent {
    
    let node: SCNNode
    
    init(width: CGFloat, height: CGFloat, length: CGFloat, boxColor: NSColor) {
        
        node = SCNNode()
        let box = SCNBox(width: width, height: height, length: length, chamferRadius: 0)
        let color = SCNMaterial()
        color.diffuse.contents = boxColor
        box.materials = [color]
        node.geometry = box
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
