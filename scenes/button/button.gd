extends Area2D

@onready var _button_sprite = $Button
@onready var _button_pressured_sprite = $ButtonPressured

signal button_activated
signal button_deactivated


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pressable"):
		button_activated.emit()
		_button_sprite.visible = false
		_button_pressured_sprite.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("pressable"):
		button_deactivated.emit()
		_button_sprite.visible = true
		_button_pressured_sprite.visible = false
