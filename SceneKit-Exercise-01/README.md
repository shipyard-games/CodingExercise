Colorful Boxes
==============

![Boxes](https://github.com/shipyard-games/CodingExercise/raw/master/SceneKit-Exercise-01/Images/Boxes1.png)

In this exercise you have a ready made scene consisting of a floor, some lights, camera and physics field. The scene graph looks like this.

![Scene Graph](https://github.com/shipyard-games/CodingExercise/raw/master/SceneKit-Exercise-01/Images/SceneGraph.png)

You can view the scene on Xcode scene editor by opening the scene file at `art.scnassets/MainScene.scn`.

The coordinate system and camera is depicted in the image below. The gravity field has been set to point towards negative Y-axis.

<img src="https://docs-assets.developer.apple.com/published/c930c799fe/1f516915-005c-4949-9bc9-38a3fe9f2a7d.png" width=400 />

The `GameViewController`
------------------------

The `GameViewController.swift` contains `viewDidLoad` method that loads the scene from the scene file and setups the `SCNView` to display that scene. It also initializes the `EnityManager` and the component system.

`EntityManager` and Component System
------------------------------------

The `EntityManager.swift` contains code for a simple manager that handles the entities in the game world and runs the update loop for all component systems. Component system has following components implemented...

* `NodeComponent` - this component is required so that the entity manager adds the node to the scene.
* `BoxComponent` - creates a box geometry.
* `MoveComponent` - has update loop that moves the node. Currently only applies small force impulse with certain time interval that makes the entity jump.
* `PhysicsComponent` - adds the physics shape and physics body configuration for entity.

The SceneKit
------------

Here's some pointers to good SceneKit related documation.

* [Apple's SceneKit Page](https://developer.apple.com/scenekit/) - Links to sample code, documentation and videos.
* [Apple's SceneKit Documentation](https://developer.apple.com/documentation/scenekit) - some newer API's are missing documentation. Hint: Use the source. ;)
  * 
* [Ray Wenderlich's SceneKit related blog posts](https://www.raywenderlich.com/category/apple-game-frameworks/agf-scenekit)
* [Apple WWDC Conference Videos](https://developer.apple.com/videos/) - look for SceneKit.
