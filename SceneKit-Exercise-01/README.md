Colorful Boxes
==============

In this exercise you have a ready made scene consisting of a number of boxes, a floor, some lights, camera and physics field. The scene graph looks like this.

* Scene Graph
  * Camera
  * Lights
    * Ambient
    * Directional
  * GravityField
  * Boxes
    * BlueBox
    * RedBox
    * GreenBox
    * YellowBox
    * PurpleBox
    * OrangeBox
  * Floor

You can view the scene on Xcode scene editor by opening the scene file at `art.scnassets/Scene.scn`.

The coordinate system and camera is depicted in the image below. The gravity field has been set to point towards negative Y-axis.

<img src="https://docs-assets.developer.apple.com/published/c930c799fe/1f516915-005c-4949-9bc9-38a3fe9f2a7d.png" width=400 />

The `GameViewController`
------------------------

The `GameViewController.swift` contains `viewDidLoad` method that loads the scene from the scene file and setups the `SCNView` to display that scene. This file also has example on how to setup a `NSClickGestureRecognizer` that will detect mouse clicks and do a hittest in the scene to see which node was clicked. The node is highlighted with a short animation.
