extends Node2D

# are we using change_scene_to method
var isTestingChangeSceneTo = false

# scene files and current path variables
var sceneOne: String = "res://Scene1.tscn"
var sceneTwo: String = "res://Scene2.tscn"
var scenePath: String = ''

# basic timer counter
var timerCounter: float = 0.0

# Our PackedScene Instance Reference
var sceneOneInstance: PackedScene
var sceneTwoInstance:PackedScene

func _ready() -> void:
	print("inside ready")
	
	if isTestingChangeSceneTo:
		sceneTwoInstance = load("res://Scene2.tscn")
		sceneOneInstance = load("res://Scene1.tscn")
		
		# check on debugger console that these two are in fact PackedScenes
		print(sceneTwoInstance)
		print(sceneOneInstance)
	# Get the name of the current scene
	scenePath = get_tree().get_current_scene().filename

func _physics_process(delta: float) -> void:
	if timerCounter > 2.0:
		print("inside physics process")
		
		if(isTestingChangeSceneTo):
			if(scenePath == sceneOne):
				var message = get_tree().change_scene_to(sceneTwoInstance)
				print(message) # OK: 0
			if scenePath == sceneTwo:
				var message = get_tree().change_scene_to(sceneOneInstance)
				print(message) # OK: 0
			
			
		else:
			if(scenePath == sceneOne):
				var message = get_tree().change_scene(sceneTwo)
				print(message) # OK: 0
			if scenePath == sceneTwo:
				var message = get_tree().change_scene(sceneOne)
				print(message) # OK: 0
	
	timerCounter += delta
