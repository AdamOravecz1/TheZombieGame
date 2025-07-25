extends Entity

@onready var animated_sprite = $AnimatedSprite2D

@onready var player = get_tree().get_first_node_in_group("Player")

var speed: int = 10
var can_move: bool = false

func _process(delta):
	animate()
	if can_move:
		move_and_slide()
	
func animate():
	if velocity == Vector2.ZERO:
		if player.global_position > global_position:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false

func _on_move_timer_timeout():
	if player:
		animated_sprite.play("walk")
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		can_move = false

func _on_animated_sprite_2d_frame_changed():
	if animated_sprite.frame == 1:
		can_move = true

func _on_animated_sprite_2d_animation_finished():
	velocity = Vector2.ZERO
	$Timers/MoveTimer.start()  
	animated_sprite.play("stand")
