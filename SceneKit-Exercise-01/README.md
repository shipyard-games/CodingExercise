SceneKit-Exercise-01
====================

_DISCLAIMER! This project has been tested with XCode 9.2 and macOS 10.13. If your system is not running these versions there might be issues. We are well aware that getting XCode projects running might be a tedious task. If the application does not run after pressing "play", let us know. Point of this exercise is not to spend time fighting with Xcode._

![Boxes](https://github.com/shipyard-games/CodingExercise/raw/master/SceneKit-Exercise-01/Images/Boxes1.png)

In this exercise you have a ready made scene consisting of a floor, some lights, camera and physics field. The scene graph looks like this.

![Scene Graph](https://github.com/shipyard-games/CodingExercise/raw/master/SceneKit-Exercise-01/Images/SceneGraph.png)

You can view the scene on Xcode scene editor by opening the scene file at `art.scnassets/MainScene.scn`.

The coordinate system and camera is depicted in the image below. The gravity field has been set to point towards negative Y-axis.

<img src="https://docs-assets.developer.apple.com/published/c930c799fe/1f516915-005c-4949-9bc9-38a3fe9f2a7d.png" width=400 />

GameViewController
------------------

The `GameViewController.swift` contains `viewDidLoad` method that loads the scene from the scene file and setups the `SCNView` to display that scene. It also initializes the `EnityManager` and the component system.

Entity Manager and Component System
-----------------------------------

The `EntityManager.swift` contains code for a simple manager that handles the entities in the game world and runs the update loop for all component systems. Component system has following components implemented...

* `NodeComponent` - this component is required so that the entity manager adds the node to the scene.
* `BoxComponent` - creates a box geometry.
* `MoveComponent` - has update loop that moves the node. Currently only applies small force impulse with certain time interval that makes the entity jump.
* `PhysicsComponent` - adds the physics shape and physics body configuration for entity.

Update Loop
-----------

`GameViewController.swift` conforms to the `SCNSceneRendererDelegate` protocol and is setup as the delegate for the `SCNView`. This means that `GameViewController`s function `renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval)` can be used to update the scene at desired interval. You can read more about SCNSceneRendererDelegate [here](https://developer.apple.com/documentation/scenekit/scnscenerendererdelegate). For this exercise it is enough to know that this is where the entity managers update is called.

Some Debugging Tips
-------------------

The `MainScene.scn` contains only the pre-made scene with floor, lights, camera and gravity field. If you want to inspect the scene at runtime you need to run the application and press the small "plus" icon at the lower left corner of the application window. Pressing that you should be able to see this window (requires Xcode 9 and MacOS 10.13).

![Settings](https://github.com/shipyard-games/CodingExercise/raw/master/SceneKit-Exercise-01/Images/Settings.png)

In this window you can see the scene at runtime and by clicking the nodes in the scenegraph you get to inscpect the different properties of the nodes.

Also, it is good to remember that you can always use XCode debugger by setting up break points to inspect what is happening in your code.

The SceneKit
------------

Here's some pointers to good SceneKit related documation.

* [Apple's SceneKit Page](https://developer.apple.com/scenekit/) - links to sample code, documentation and videos.
* [Apple's SceneKit Documentation](https://developer.apple.com/documentation/scenekit) - some newer API's are missing documentation. Hint: Use the source. ;)
* [GameplayKit Documentation](https://developer.apple.com/library/content/documentation/General/Conceptual/GameplayKit_Guide/index.html) - implementations for example for random number generation and component system.
* [Ray Wenderlich's SceneKit related blog posts](https://www.raywenderlich.com/category/apple-game-frameworks/agf-scenekit)
* [Apple WWDC Conference Videos](https://developer.apple.com/videos/) - look for SceneKit.
