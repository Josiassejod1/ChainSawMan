extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var GRAVITY = 10
var JUMP = 25


@onready var _animated_sprite = $animation
# Called when the node enters the scene tree for the first time.

@export var speed = 200 
var screen_size 

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	velocity.y += GRAVITY
	if Input.is_action_pressed("ui_up"):
		_animated_sprite.play("jump")
		velocity.y += -JUMP
	move_and_slide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	if Input.is_action_pressed("ui_down"):
		_animated_sprite.play("slide")
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
		_animated_sprite.flip_h = false
		_animated_sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		velocity.x += -1
		_animated_sprite.flip_h = true
		_animated_sprite.play("run")
	elif Input.is_action_pressed("space"):
		_animated_sprite.play("attack")
	else:
		_animated_sprite.play("idle")

	position += velocity * delta * speed
	position.x =  clamp(position.x, 0, screen_size.x)
	position.y =  clamp(position.y, 0, screen_size.y)
