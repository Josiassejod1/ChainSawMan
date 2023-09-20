extends Node

const MAX_HEALTH = 5
var health = MAX_HEALTH
# Called when the node enters the scene tree for the first time.
func _ready():
	update_health_ui()
	
func update_health_ui():
	set_health_label()
	$HealthBarProgress.max_value = MAX_HEALTH
	set_health_bar()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		damage()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func damage():
	health -= 1
	if health < 0:
		health = MAX_HEALTH
	set_health_bar()
	set_health_label()
		
func set_health_bar():
	$HealthBarProgress.value = health
	
func set_health_label():
	$HealthBarLabel.text = "Health: %s" % health
	
