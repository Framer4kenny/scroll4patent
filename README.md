# scroll4patent
scrollmethod4patent

- 롱프레스한 좌표에 맞춰 버튼 띄우기
```
toon.onLongPress (event, layer) ->
	scrollCue.visible = true
	scrollCue.point = {x: event.point.x-scrollCue.width/2, y: event.point.y-scrollCue.height/2} 	
	Utils.delay 7, ->
		scrollCue.visible = false
```
