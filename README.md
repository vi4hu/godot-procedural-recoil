# Godot Procedural Recoil

Godot port of Gilbert's procedural recoil system for Unity

This project is a Godot Engine addon that adds class **ProceduralRecoil**. This new class make easy **procedural-recoil** creation possible for 3D games. It is available under the terms of the **MIT** License.

## Installation
#### Method One:
1. Search "Godot procedural recoil" in the AssetLib
2. Download and Install

#### Method Two:
1. Clone this repo or download as zip from matching branch
2. Copy/Move the `res://addons/procedural-recoil` directory to your `res://addons` directory

## Uninstallation
- Make sure you have removed all the attached ProceduralRecoil scripts from Scenes.
- Delete the `res://addons/procedural-recoil` directory from your project. Make sure to delete it using the Godot editor instead of your default file system program.


## Usage
Attach ProceduralRecoil script to a preferred Node.

![Scene Hierarchy of the player](https://github.com/vi4hu/godot-procedural-recoil/blob/main/scene-heirarchy.png)
In the screenshot above, the `Head` node is rotated by mouse input and `recoil.gd` is attached to the `CameraRecoil` node.

### Procdural Recoil Parameters
`Recoil`: Rotation vector added to the target rotation whenever `recoilFire()` is called

`Aim Recoil`: Rotation vector added to the target rotation whenever `recoilFire(true)` is called

`Snappiness`: Rate at which the current rotation lerps to the target rotation

`Return Speed`: Rate at which the target rotation returns to `(0, 0, 0)`

### Functions

`recoilFire(isAiming : bool = false)`
  
- Adds rotation vector to the target rotation, which vector is added is determined by `isAiming`

`setRecoil(newRecoil : Vector3)`
  
- Sets the recoil vector to `newRecoil`

`setAimRecoil(newRecoil : Vector3)`
  
- Sets the aim recoil vector to `newRecoil`

## Current Issues

Extremely small z-axis rotations are applied to the rotation, even when the z-axis value of the recoil vector is set to 0. The fix for this issue is to manually set `global_rotation.z` of the node to 0 every frame.

Make sure to change this if you don't want this rotation to be overridden.


## Credits
- Credit to Gilbert for the original system: [Youtube tutorial](https://www.youtube.com/watch?v=geieixA4Mqc)
- Credit to [AceSpectre](https://github.com/AceSpectre) for Godot port
