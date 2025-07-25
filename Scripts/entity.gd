class_name Entity
extends CharacterBody2D

var alive := true
var died := false
var health := 0:
	set(value):
		health = value
		if health <= 0:
			trigger_death()
			
func trigger_death():
	pass
	
