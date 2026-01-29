extends StaticBody3D
@onready var anim: AnimationPlayer = $AnimationPlayer

func _on_area_3d_body_entered(body: Node3D) -> void:
	anim.play("pressdown")


func _on_area_3d_body_exited(body: Node3D) -> void:
	anim.play("pressup")
