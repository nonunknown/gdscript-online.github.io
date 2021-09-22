extends VBoxContainer

var bt_scrlist:Button
var bt_initial_pos:Vector2
var bt_hide_pos:Vector2

func _ready() -> void:
	print("hio")
	bt_scrlist = get_tree().get_nodes_in_group("BT_SCR")[0]
#	bt_scrlist.connect("toggled",self, "_on_bt_scrlist_toggled")
	
	bt_initial_pos = bt_scrlist.rect_position
	bt_hide_pos = Vector2(0,bt_initial_pos.y)
	
	#add Ajax support to make requests to server
	JavaScript.eval("""
	
	var scr = document.createElement('script')
	scr.setAttribute('src', 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js')
	scr.setAttribute('integrity', 'sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==')
	scr.setAttribute('crossorigin', 'anonymous')
	scr.setAttribute('referrerpolicy','no-referrer')
	document.head.appendChild(scr)
	
	
	""")
	
	pass



func _on_bt_scrlist_pressed() -> void:
	visible = !visible
	if visible:
		bt_scrlist.text = "<"
		bt_scrlist.rect_position = bt_initial_pos
		var result = JavaScript.eval("""
			console.log("requesting files...")
			$.get('http://localhost:3000/files', (data)=>{
				return data
			})
			
		  """)
		print(result)
	else:
		bt_scrlist.text = ">"
		bt_scrlist.rect_position = bt_hide_pos
	pass # Replace with function body.
