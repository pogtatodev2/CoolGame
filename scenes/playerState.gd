extends RichTextLabel

var fakeText = "state: %s"
var printedText = fakeText % PlayerVars.playerState

func _process(delta):
	fakeText = "state: %s"
	printedText = fakeText % PlayerVars.playerState
	
	
	self.set_text(printedText)
	
