extends Node

const MAX_HEALTH = 5
var health = MAX_HEALTH
signal health_changed(new_max)
signal depleted

# Called when the node enters the scene tree for the first time.
func _ready():
	update_health_ui()
	
func update_health_ui():
	$HealthBarProgress.max_value = MAX_HEALTH
	set_health_bar()
	
func _input(event):
	# TODO: remove after demo
	if event.is_action_pressed("ui_accept"):
		damage()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func damage():
	health -= 1
	emit_signal("health_changed", health)
	if health < 0:
		health = MAX_HEALTH
		emit_signal("depleted")
	set_health_bar()
		
func set_health_bar():
	$HealthBarProgress.value = health
	
	
