extends AnimatableBody2D

@onready var timer: Timer = $Timer
@onready var falling_plat: AnimatableBody2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not timer.is_stopped():
		return
	timer.start()

func _on_timer_timeout() -> void:
	falling_plat.visible = false
	collision_shape_2d.disabled = true
	await get_tree().create_timer(3.0).timeout
	falling_plat.visible = true
	collision_shape_2d.disabled = false
 
