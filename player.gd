extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready var _animated_sprite = $animation
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		_animated_sprite.play("jump")
	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.play("slide")
	elif Input.is_action_pressed("ui_right"):
		_animated_sprite.play("run")
	elif Input.is_action_pressed("space"):
		_animated_sprite.play("attack")
	else:
		_animated_sprite.play("idle")
