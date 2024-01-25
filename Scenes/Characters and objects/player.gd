extends Area2D


@export var speed = 256
var screen_size


func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		$AnimatedSprite2D.animation = "default"
	
	if velocity.y > 0:
		if velocity.x != 0:
			$AnimatedSprite2D.animation = "diagonal_down"
			$AnimatedSprite2D.flip_v = false
		else:
			$AnimatedSprite2D.animation = "new_up"
			$AnimatedSprite2D.flip_v = true
	elif velocity.y < 0:
		$AnimatedSprite2D.flip_v = false
		if velocity.x != 0:
			$AnimatedSprite2D.animation = "diagonal_up"
		else:
			$AnimatedSprite2D.animation = "new_up"
	else:
		$AnimatedSprite2D.flip_v = false
		if velocity.x != 0:
			$AnimatedSprite2D.animation = "sideways"
		else:
			$AnimatedSprite2D.animation = "default"
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		
	$AnimatedSprite2D.play()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
