extends CharacterBody2D

@export var speed = 70

var direction : float

var spawnPosition : Vector2
var spawnRotation : float

var currentAnimation = "moving"

@onready var animatedSprite = $AnimatedSprite2D

func _ready():
	global_position = spawnPosition
	global_rotation = spawnRotation

func _physics_process(delta):
	animatedSprite.play(currentAnimation)
	velocity = Vector2(+speed, 0).rotated(direction)
	
	move_and_slide()

func _on_timer_timeout():
	queue_free() # Replace with function body.
