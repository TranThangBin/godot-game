extends Area2D

@onready var _button_sprite = $Button
@onready var _button_pressured_sprite = $ButtonPressured


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pressable"):
		_button_sprite.visible = false
		_button_pressured_sprite.visible = true
