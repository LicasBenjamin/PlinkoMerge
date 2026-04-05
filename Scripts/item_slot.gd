extends Panel

@onready var icon: TextureRect = $Icon
@export var item : ItemData

@export var normal_style: StyleBoxFlat
@export var selected_style: StyleBoxFlat

@export var is_active : bool
@export var lock_image : Texture2D

signal box_selected(Panel)
signal item_moved(Panel)

func _ready() -> void:
	update_ui()
	if !is_active:
		icon.texture = lock_image

func update_ui() -> void:
	if not item:
		icon.texture = null
		return
	
	icon.texture = item.icon
	#tooltip_text = item.item_name

func _get_drag_data(_at_position: Vector2) -> Variant:
	if not item or not is_active:
		return
	
	var preview = duplicate()
	var c = Control.new()
	c.add_child(preview)
	preview.position -= Vector2(110,110) #middle of 220x220 img
	preview.self_modulate = Color.TRANSPARENT
	c.modulate = Color(c.modulate, 0.5)
	
	set_drag_preview(c)
	icon.hide()
	return self

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	if not is_active:
		return false
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if not is_active:
		return
	
	var tmp = item
	item = data.item
	data.item = tmp
	
	if tmp != null:
		if item.coin_value == data.item.coin_value && (data != self) && item.next_item != null: #If Mergable
			#print("Combined item value: "+str(item.coin_value+data.item.coin_value))
			#Upgrade item here
			item = item.next_item
			data.item = null
			#box_selected.emit(data.item) #selecting box of upgraded item
	
	if data != self: #If any item was moved
		item_moved.emit(self)
	
	icon.show()
	data.icon.show()
	update_ui()
	data.update_ui()

#func _gui_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			#print("Clicked slot:", self)
			
#Allowing clicking on each tile for selecting the current coin to be used
var is_dragging := false
var drag_start_pos := Vector2.ZERO
var drag_threshold := 10.0
func _gui_input(event: InputEvent) -> void:
	if not is_active:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_dragging = false
				drag_start_pos = event.position
			else:
				# Mouse released → treat as click ONLY if not dragging
				if not is_dragging:
					#SELECT FUNCTION HERE
					box_selected.emit(self)
					#print("isSelected")
	elif event is InputEventMouseMotion:
		if (event.position - drag_start_pos).length() > drag_threshold:
			is_dragging = true

func set_selected(selected: bool):
	if selected:
		add_theme_stylebox_override("panel", selected_style)
	else:
		add_theme_stylebox_override("panel", normal_style)
