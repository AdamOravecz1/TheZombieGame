extends Entity

@onready var animated_sprite = $AnimatedSprite2D
@onready var weapon = $Weapon

var speed: int = 150

func _process(delta):
	movement()
	animate()
	move_and_slide()
	
func movement():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	var to_mouse = get_global_mouse_position() - weapon.global_position
	weapon.rotation = to_mouse.angle() + deg_to_rad(180) 

func animate():
	if velocity != Vector2.ZERO:
		animated_sprite.play("run")
	else:
		animated_sprite.play("stand")
		
	if velocity.x > 0:
		animated_sprite.flip_h = true
	elif velocity.x < 0:
		animated_sprite.flip_h = false
	if get_global_mouse_position() > global_position:
		weapon.scale.y = -1
	else:
		weapon.scale.y = 1
