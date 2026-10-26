extends Control

# Контейнер для сердечек
@export var hearts_container: FlowContainer

# Лейблы с данными
@export var name_label: Label
@export var lv_label: Label
@export var hp_label: Label
@export var mov_label: Label
@export var bag_label: Label
@export var wg_label: Label
@export var time_label: Label

# Текстура сердечка
var heart_icon = preload("res://assets/heart.png")


func _ready() -> void:
	# Выводим информацию на карточку
	update_info()
	# Рисуем сердечки (1 сердце = 2 hp)
	update_hearts(int(Global.hp))
	# Время
	update_time()


func update_info() -> void:
	# Простой уровень: если есть здоровье и скорость, то 1, иначе 0
	if int(Global.hp) > 0 and int(Global.mov) > 0:
		lv_label.text = "1"
	else:
		lv_label.text = "0"

	# Остальные данные в Label
	name_label.text = str(Global.name_user)
	hp_label.text = str(Global.hp)
	mov_label.text = str(Global.mov)
	bag_label.text = str(Global.bag)
	wg_label.text = str(Global.wg)


func update_hearts(hp_value: int) -> void:
	# Очищаем контейнер от старых сердец
	for child in hearts_container.get_children():
		child.queue_free()

	# Считаем количество сердец
	var count = int(floor(hp_value / 2.0))

	# Создаём нужное число сердец
	for i in range(count):
		var rect = TextureRect.new()
		rect.texture = heart_icon
		rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		rect.custom_minimum_size = Vector2(11, 10)
		hearts_container.add_child(rect)


func update_time() -> void:
	var t = Time.get_time_dict_from_system()
	time_label.text = "%02d:%02d" % [t.minute, t.second]


# Сигнал timeout от узла Timer (Wait Time = 1, Autostart = On)
func _on_timer_timeout() -> void:
	update_time()
