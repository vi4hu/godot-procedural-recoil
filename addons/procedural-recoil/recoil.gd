class_name ProceduralRecoil
extends Node3D

# Rotations
var currentRotation : Vector3
var targetRotation : Vector3

@export_category("Recoil Vectors")
## 3D vector representing the recoil force applied on each axis.
@export var recoil : Vector3
## 3D vector representing the recoil force applied on each axis while aiming.
@export var aimRecoil : Vector3

@export_category("Settings")
## Rate at which the current rotation lerps to the target rotation
@export var snappiness : float
## Speed at which the weapon returns to its original position.
@export var returnSpeed : float

## Node containing "fire" signal and weapon logic
@export var action_node: Node3D


func _process(delta : float) -> void:
	# Lerp target rotation to (0,0,0) and lerp current rotation to target rotation
	targetRotation = lerp(targetRotation, Vector3.ZERO, returnSpeed * delta)
	currentRotation = lerp(currentRotation, targetRotation, snappiness * delta)
	
	# Set rotation
	rotation = currentRotation
	
	# Camera z axis tilt fix, ignored if tilt intentional
	# I have no idea why it tilts if recoil.z is set to 0
	if recoil.z == 0 and aimRecoil.z == 0:
		global_rotation.z = 0
	
	if action_node and action_node.has_signal("fire") and not action_node.is_connected("fire", recoilFire):
		action_node.connect("fire", recoilFire)


func recoilFire(isAiming : bool = false):
	print(1)
	"""
	Function that initiates the recoil.
	"""
	if isAiming:
		targetRotation += Vector3(aimRecoil.x, randf_range(-aimRecoil.y, aimRecoil.y), randf_range(-aimRecoil.z, aimRecoil.z))
	else:
		targetRotation += Vector3(recoil.x, randf_range(-recoil.y, recoil.y), randf_range(-recoil.z, recoil.z))
	
	rotation = targetRotation


func setRecoil(newRecoil : Vector3):
	"""
	Change recoil value.
	"""
	recoil = newRecoil


func setAimRecoil(newRecoil : Vector3):
	"""
	Change recoil value for aiming.
	"""
	aimRecoil = newRecoil
