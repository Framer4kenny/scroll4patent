
ScrollBox = new ScrollComponent
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false

ScrollBox.mouseWheelEnabled = true
	
toon = new Layer
	width: 750
	height: 57000
	image: "images/toon_750.jpg"
	parent: ScrollBox.content
	
bottom = new Layer
	width: 750
	height: 88
	image: "images/bottom.jpg"
	y: 1246

top = new Layer
	width: 750
	height: 88
	image: "images/top.jpg"

bottom.states.add
	stateA:
		y: 1334

top.states.add
	stateA:
		y: -88
	
#toon.onClick (event, layer) ->
toon.on Events.Click, ->
	bottom.states.next()
	top.states.next()

ScrollBox.on Events.Move, ->
	if ScrollBox.scrollY <= 0 || ScrollBox.scrollY >= 20066
		top.y = 0
		bottom.y = 1246
	else 
		top.y = -88
		bottom.y = 1334
		print ScrollBox.scrollY


scrollCue = new Layer
	width: 67
	height: 239
	image: "images/scrollCue.png"
	visible: false

toon.onLongPress (event, layer) ->
	scrollCue.visible = true
	scrollCue.point = {x: event.point.x-scrollCue.width/2, y: event.point.y-scrollCue.height/2} 	
	Utils.delay 7, ->
		scrollCue.visible = false

upLayer = new Layer
	width: 67
	height: 70
	parent: scrollCue
	opacity: 0
	
downLayer = new Layer
	width: 67
	height: 62
	parent: scrollCue
	y: 177
	opacity: 0

upLayer.onClick (event, layer) ->

	ScrollBox.content.animate
		properties:
			y: -ScrollBox.content.height/2
#		print ScrollBox.point.y
		time: 10

upLayer.onDoubleClick (event, layer) ->		
#upLayer.onDoubleTap (event, layer) ->
	ScrollBox.content.animate
		properties:
			y: 0
		time: 1

downLayer.onClick (event, layer) ->
	ScrollBox.content.animate
		properties:
			y: - ScrollBox.content.height/2
		time: 10

downLayer.onDoubleClick (event, layer) ->
	ScrollBox.content.animate
		properties:
			y: - ScrollBox.content.height + 1250
		time: 1






