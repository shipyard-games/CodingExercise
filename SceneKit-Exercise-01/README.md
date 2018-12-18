SceneKit-Exercise-01
====================

_DISCLAIMER! This project has been tested with XCode 9.2 and macOS 10.13. If your system is not running these versions there might be issues. We are well aware that getting XCode projects running might be a tedious task. If the application does not run after pressing "play", let us know. Point of this exercise is not to spend time fighting with Xcode. You may have to fix the project to use your own Apple Developer account for signing. That should be all._

![Boxes](https://github.com/shipyard-games/CodingExercise/raw/master/SceneKit-Exercise-01/Images/Boxes1.png)

What We Expect of You
---------------------

This exercise is more about writing code than doing game design. Spend more time thinking about how you would code something than thinking if this is actually a good game or not. We value reusable and compartmentalized code rather than do-it-all classes. Design this small project in a way that if this would be a larger game project you could manage your code easily.

This project contains a simple "game" where boxes fall from sky on the floor and they bounce around. Player’s task is to destroy the boxes by clicking them. You need to think how can you make this into a game with a start, an end and a clear goal for the player:

  1. Implement movement for the boxes to make the game harder.
  2. Implement some kind of scoring system. How do you get score from hitting the boxes?
  3. Implement a simple UI to display the score.

After you're satisfied with what you've done, you can email it to the person you received the task from. 

What If I don't Have a mac / XCode?
-----------------------------------

If you do not have a mac or access to one, you can do this exercise with Unity https://unity3d.com.

Below is a video of the macOS version of the exercise running and you can replicate it in Unity. The video shows boxes of different colours appearing and falling down as the floor appears to shake from time to time. When a box is clicked it disappears. SceneKit uses a similar entity-component system design as Unity and therefore the Swift code you see in the XCode project can easily be replicated in Unity. It is also a good way to start learning about SceneKit and Swift. 

![Video](https://github.com/shipyard-games/CodingExercise/raw/master/SceneKit-Exercise-01/SceneKit-Exercise-01/SceneKit-Exercise-Video.mov)

What the Project Contains
=========================

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

The `MainScene.scn` contains only the pre-made scene with floor, lights, camera and gravity field. If you want to inspect the scene at runtime you need to run the application and press the small "settings" icon at the lower left corner of the application window. Pressing that you should be able to see this window (requires Xcode 9 and MacOS 10.13).

![Settings](https://github.com/shipyard-games/CodingExercise/raw/master/SceneKit-Exercise-01/Images/Settings.png)

In this window you can see the scene at runtime and by clicking the nodes in the scenegraph you get to inscpect the different properties of the nodes.

If you press the "plus" icon you should see somethign like this.

![Settings](https://github.com/shipyard-games/CodingExercise/raw/master/SceneKit-Exercise-01/Images/Boxes2.png)

This is a profiler view that tells how well your game is performing. Not too important for this task.

Also, it is good to remember that you can always use XCode debugger by setting up break points to inspect what is happening in your code.

The SceneKit
------------

Here's some pointers to good SceneKit related documation.

* [Apple's SceneKit Page](https://developer.apple.com/scenekit/) - links to sample code, documentation and videos.
* [Apple's SceneKit Documentation](https://developer.apple.com/documentation/scenekit) - some newer API's are missing documentation. Hint: Use the source. ;)
* [GameplayKit Documentation](https://developer.apple.com/library/content/documentation/General/Conceptual/GameplayKit_Guide/index.html) - implementations for example for random number generation and component system.
* [Ray Wenderlich's SceneKit related blog posts](https://www.raywenderlich.com/category/apple-game-frameworks/agf-scenekit)
* [Apple WWDC Conference Videos](https://developer.apple.com/videos/) - look for SceneKit.
