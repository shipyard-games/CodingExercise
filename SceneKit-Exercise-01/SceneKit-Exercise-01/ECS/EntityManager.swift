//
//  EntityManager.swift
//  SceneKit-Exercise-01
//
//  Created by Andreas Wedenberg on 07/01/2018.
//  Copyright © 2018 Shipyard Games Oy. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    
    var entities = Set<GKEntity>()
    let scene: SCNScene
    
    var componentSystems = [GKComponentSystem]()
    
    var toRemove = Set<GKEntity>()
    
    init(scene: SCNScene) {
        self.scene = scene
    }
    
    func add(_ componentSystem: GKComponentSystem<GKComponent>) {
        componentSystems.append(componentSystem)
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let sceneNode = entity.component(ofType: NodeComponent.self)?.node {
            scene.rootNode.addChildNode(sceneNode)
        }
        
        for componentSystem in componentSystems {
            componentSystem.addComponent(foundIn: entity)
        }
    }
    
    func remove(_ entity: GKEntity) {
        if let sceneNode = entity.component(ofType: NodeComponent.self)?.node {
            sceneNode.removeFromParentNode()
        }
        
        entities.remove(entity)
        toRemove.insert(entity)
    }
    
    func update(_ deltaTime: CFTimeInterval) {
        for componentSystem in componentSystems {
            componentSystem.update(deltaTime: deltaTime)
        }
        
        for currentRemove in toRemove {
            for componentSystem in componentSystems {
                componentSystem.removeComponent(foundIn: currentRemove)
            }
        }
        toRemove.removeAll()
    }
    
  
}
