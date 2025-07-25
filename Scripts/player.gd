extends Entity

@onready var animated_sprite = $AnimatedSprite2D

var speed: int = 150




func _process(delta):
	movement()
	animate()
	move_and_slide()
	
func movement():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed


func animate():
	if velocity != Vector2.ZERO:
		animated_sprite.play("run")
	else:
		animated_sprite.play("stand")
		
	if velocity.x > 0:
		animated_sprite.flip_h = true
	elif velocity.x < 0:
		animated_sprite.flip_h = false
