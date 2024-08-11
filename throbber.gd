extends Control

var throbber_characters := PackedStringArray(["-", "\\", "|", "/"])
var throbber_period := 0.5
var progress := 0.0

func _process(delta: float) -> void:
	progress += delta 
	var index := int(fposmod(progress / throbber_period, 1.0) * 4.0)
	$Throbber.text = throbber_characters[index]
