extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var movespeed = 500
var bullet_speed = 2000
var bullet = preload("res://Scenes/Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	var motion = Vector2()
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())
	
	
	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
func kill():
	get_tree().reload_current_scene()
	
	

	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "Enemy1" in body.name:
		kill()
