extends Node3D
@onready var Body = $RigidBody3D


var impulse = Vector3(0,10,0)



func _on_area_3d_area_entered(_area: Area3D) -> void:
	Body.apply_central_impulse(impulse)
	await get_tree().create_timer(0.2).timeout
	queue_free()
