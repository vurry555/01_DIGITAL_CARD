extends Control

# Сюда перетащим поля ввода из сцены
@export var hp: TextEdit
@export var mov: TextEdit
@export var bag: TextEdit
@export var wg: TextEdit
@export var name_input: TextEdit

# Тут выберем сцену с карточкой (ui.tscn)
@export var next_scene: PackedScene


func _on_next_button_pressed() -> void:
	# Не забываем: Global-сообщение с данными
	Global.set_info(
		hp.text.strip_edges(),
		mov.text.strip_edges(),
		bag.text.strip_edges(),
		wg.text.strip_edges(),
		name_input.text.strip_edges()
	)

	# Инстанцируем и показываем следующую сцену, текущую удаляем
	var new_scene = next_scene.instantiate()
	get_tree().root.add_child(new_scene)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = new_scene
