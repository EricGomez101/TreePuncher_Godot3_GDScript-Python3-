extends Node2D

onready var anim = $Animation

var center
var offset
var game
var right = true


func _ready():
	game = get_parent()
	center = get_viewport_rect().size.x / 2
	offset = abs(position.x - center)
	connect("area_entered", self, "onAreaEntered")
	
func onAreaEntered(area):
	if area.is_in_group("Axes"):
		game.die()
func _input(event):
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and event.is_pressed():
		if event.position.x < center:
			position.x = center - offset
			scale.x = -abs(scale.x)
			right = false
		else:
			position.x = center + offset
			scale.x = abs(scale.x)
			right = true
		
		
		anim.play("Punch")
		game.punchTree(right)
	