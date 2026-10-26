extends Node

# Глобальные переменные (доступны из любой сцены как Global.hp и т.д.)
var hp = "5"
var mov = "5"
var bag = "5"
var wg = "5"
var name_user = "lele"

# Записываем значения переменных
func set_info(_hp, _mov, _bag, _wg, _name):
	hp = _hp
	mov = _mov
	bag = _bag
	wg = _wg
	name_user = _name
