extends Control

var selectedAct = 0
var levelsSelected = false

func _ready():
	$actSelect.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func bringUpLevels():
	$actSelect.visible = false
	$actSelect/loading.start()
	$actSelect/AudioStreamPlayer2D.play()
	$throbber.visible = true
	$levelSelect.grab_focus()
	$subtitle.set_text("enter level:")
	levelsSelected = true
	
func bringDownLevels():
	$actSelect.visible = true
	$levelSelect.visible = false
	$actSelect.grab_focus()
	$subtitle.set_text("insert disc:")
	$throbber.visible = false
	levelsSelected = false
	

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and levelsSelected == false:
		bringUpLevels()
	elif Input.is_action_just_pressed("ui_cancel") and levelsSelected == true:
		bringDownLevels()    #no n
		
	#wwwddddd dddduunududududu WHATTT DUUU HEEIILL
	#DIDID DELA DIDI DELA
	#KABLOOOOEYYYy!!!!
		
		
		

func _on_act_select_item_selected(index):
	if $actSelect.is_selected(0):
		selectedAct = 0
	elif $actSelect.is_selected(1):
		selectedAct = 1
	elif $actSelect.is_selected(2):
		selectedAct = 2


func _on_loading_timeout():
	pass

func _on_audio_stream_player_2d_finished():
	$levelSelect.visible = true
	$throbber.visible = false
	$levelSelect.grab_focus()

