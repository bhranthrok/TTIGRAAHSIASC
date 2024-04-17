extends CharacterBody2D

var healthPoints = 3
var stamina: float = 100
var speed = 35
var exhausted: bool = false
var timeAcquired = false

@onready var animatedSprite = $AnimatedSprite2D

# This is run on every frame
func _physics_process(delta):
	velocity = Vector2()
	
	if !timeAcquired:
		Global.time_start = Time.get_ticks_msec()
		timeAcquired = true
	
	# Resets base speed after sprinting
	if healthPoints != 1:
		speed = 35
	
	# Plays Idle animation according to HP
	if healthPoints == 3:
		animatedSprite.play("idle3hp")
	if healthPoints == 2:
		animatedSprite.play("idle2hp")
	if healthPoints <= 1:
		speed = 17.5 # speed also lowered
		animatedSprite.play("idle1hp")
	
	# Death
	if healthPoints <= 0:
		Global.time_end = Time.get_ticks_msec()
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	
	# movement
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		
	# Stamina
	if Input.is_action_pressed("shift") && stamina > 0 && !exhausted: # Uses stamina to sprint
		speed *= 3
		stamina -= 2
		if stamina < 0:
			stamina = 0
		print("stamina: ",stamina)
	if !Input.is_action_pressed("shift") && stamina < 100: # Recovers stamina while walking
		stamina += 0.5
		print("stamina: ",stamina)
	if stamina == 0:
		exhausted = true
	if stamina > 20:
		exhausted = false
		
	# Normalizes vector for diagonal movement
	velocity = velocity.normalized() * speed
	
	# moves player according to the velocity vector
	move_and_slide()

# On collision with other groups
func _on_area_2d_area_entered(area):
	if area.is_in_group("fireball"):
		$DamageSFX.play()
		healthPoints -= 1
