extends RichTextLabel

var cheese = ":D"
var fakeText = "speed: %s"
var printedText = fakeText % PlayerVars.playerSPEED

func _process(delta):
	fakeText = "speed: %s"
	printedText = fakeText % PlayerVars.playerSPEED
	
	self.set_text(printedText)

	
