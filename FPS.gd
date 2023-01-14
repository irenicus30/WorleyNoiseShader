extends Label


func _process(_delta):
    var s = "fps is "
    s = s + str(Engine.get_frames_per_second())
    set_text(s)
