extends Node

const _TABLE_NAME = "user_preferences"

var _db: SQLite
var _schema = {
	"volume": {"data_type": "FLOAT"},
	"fps_id": {"data_type": "INT"},
	"fullscreen": {"data_type": "BOOLEAN"},
}


func _db_instance() -> SQLite:
	if _db == null:
		_db = SQLite.new()
		_db.path = "res://user_preferences.db"
		_db.open_db()
		_db.create_table(_TABLE_NAME, _schema)
	return _db


func get_preferences() -> Dictionary:
	var rows := _db_instance().select_rows(_TABLE_NAME, "TRUE", ["*"])
	if len(rows) == 0:
		return {}
	return rows[0]


func save_preferences(pref):
	if get_preferences().is_empty():
		_db_instance().insert_row(_TABLE_NAME, pref)
	else:
		_db_instance().update_rows(_TABLE_NAME, "TRUE", pref)
