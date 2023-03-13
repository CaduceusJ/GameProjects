extends CharacterBody2D

var run_speed = 200
var direction = 3

func get_input():
	
	velocity.x = 0
	velocity.y = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var up = Input.is_action_pressed('ui_up')
	var down = Input.is_action_pressed("ui_down")


	if right:
		velocity.x += run_speed
		direction = 0
		$AnimatedSprite2D.play("right")
	elif left:
		direction = 1
		velocity.x -= run_speed
		$AnimatedSprite2D.play("left")
	elif down:
		direction = 3
		velocity.y += run_speed
		$AnimatedSprite2D.play("down")
	elif up:
		direction = 2
		velocity.y -= run_speed
		$AnimatedSprite2D.play("up")

	
	

func _physics_process(delta):
	if velocity.x == 0 and velocity.y == 0:
		if direction == 0:
			$AnimatedSprite2D.play("idle_right")
		if direction == 1:
			$AnimatedSprite2D.play("idle_left")
		if direction == 2:
			$AnimatedSprite2D.play("idle_up")
		if direction == 3:
			$AnimatedSprite2D.play("idle_down")
			
	get_input()
	move_and_slide()
