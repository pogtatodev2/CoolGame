extends CharacterBody2D

#bong
#bonginchol!
#lmao!
#lmaoooo!!!!


var falling = false
@export var SPEED = 250
@export var JUMP_VELOCITY = -425
var spellTableScene = preload("res://scenes/spell_wheel.tscn")
var spellToggled = false
var SECOND_JUMP_VEL = -560
var THIRD_JUMP_VEL = -340
var FOURTH_JUMP_VEL = -340
var isSlamming = false
@export var currentDir = "right"
var tween = create_tween()
var jumpCounter = PlayerVars.jumpCounter
@export var dashLength = 100
var dash = Input.is_action_just_pressed("dash")

func _ready():
	var dashTimer = $dashTime
	$CanvasLayer/spellWheel.visible = false
	


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	
	if Input.is_action_just_pressed("bringUpSpells") && spellToggled == false:
		print("df")
		$CanvasLayer/spellWheel.visible = true
		Engine.time_scale = 0.05
		spellToggled = true
		
	elif Input.is_action_just_pressed("bringUpSpells") && spellToggled == true:
		$CanvasLayer/spellWheel.visible = false
		spellToggled = false
		Engine.time_scale = 1
		print("c")
	

func slam():
	isSlamming = true
	velocity.y = 1500


func _physics_process(delta):

	if is_on_floor():
		isSlamming = false
	elif !is_on_floor() and Input.is_action_just_pressed("down"):
		slam()
		
	
	PlayerVars.playerSPEED = SPEED
	if PlayerVars.stamina < 3 and spellToggled == false:
		PlayerVars.stamina += 0.01 
	if PlayerVars.stamina > 3:
		PlayerVars.stamina = 3.0
	if PlayerVars.stamina < 0:
		PlayerVars.stamina = 0
	
	if Input.is_action_just_pressed("dash") and PlayerVars.stamina > 0.5:
		PlayerVars.playerState = "duringDash"
		$dashTimer.start()
		PlayerVars.stamina -= 1
		print(PlayerVars.stamina)
	if PlayerVars.playerState == "duringDash" and currentDir == "right":
		velocity.x = 3000
	elif PlayerVars.playerState == "duringDash" and currentDir == "left":
		velocity.x = -3000
	else:
		velocity.x += 0
	
	
	
	# Add the gravity.
	if not is_on_floor() and isSlamming == false:
		velocity.y += gravity * delta
		$fallingAnim.show()
		$fallingAnim.play()
		falling = true
		$jumptext.show()
		
	else:
		PlayerVars.jumpCounter = 0
		$jumptext.hide()
		$fallingAnim.hide()
		falling = false



	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and PlayerVars.jumpCounter < PlayerVars.jumpLimit and PlayerVars.jumpCounter < 3:
		velocity.y = JUMP_VELOCITY
		PlayerVars.jumpCounter += 1
	elif Input.is_action_just_pressed("ui_accept") and PlayerVars.jumpCounter < PlayerVars.jumpLimit and PlayerVars.jumpCounter >= 3:
		velocity.y = SECOND_JUMP_VEL
		PlayerVars.jumpCounter += 1
		
	
	if Input.is_action_just_pressed("backward"):
		currentDir = "left"
	if Input.is_action_just_pressed("forward"):
		currentDir = "right"
		
	var direction = Input.get_axis("backward", "forward")
	PlayerVars.DIR = currentDir
	
	if direction and !falling and PlayerVars.playerState != "duringDash":
		$walkAnim.visible = true
		$walkAnim.play()
		$idleAnim.stop()
		$idleAnim.visible = false
		velocity.x = direction * SPEED 
	elif direction and !falling and PlayerVars.playerState == "duringDash" and currentDir == "right":
		$walkAnim.visible = true
		$walkAnim.play()
		$idleAnim.stop()
		$idleAnim.visible = false
		velocity.x += 600
	elif direction and !falling and PlayerVars.playerState == "duringDash" and currentDir == "left":
		$walkAnim.visible = true
		$walkAnim.play()
		$idleAnim.stop()
		$idleAnim.visible = false
		velocity.x = velocity.x - 600
		
		
	
	elif !direction and !falling:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$walkAnim.visible = false
		$idleAnim.play()
		$walkAnim.stop()
		$idleAnim.visible = true
	elif falling and PlayerVars.playerState == "duringDash" and currentDir == "right":
		velocity.x = 10000
	elif falling and PlayerVars.playerState == "duringDash" and currentDir == "left":
		velocity.x = -10000
	elif falling:
		$walkAnim.hide()
		$idleAnim.stop()
		$walkAnim.stop()
		$idleAnim.hide()
		velocity.x = direction * SPEED / 1.5 


		

	move_and_slide()


func _on_dash_timer_timeout():
	PlayerVars.playerState =  "notDashing"
