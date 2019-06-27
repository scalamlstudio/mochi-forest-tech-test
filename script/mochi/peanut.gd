extends AnimatedSprite

export var speed = 20
export var direction = 0

var anim

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = get_node("PeanutAnim")
	set_process(true)
	print("[SPAWN] Peanut at ", get_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = 0
	if Input.is_action_pressed("ui_left"):
		direction -= 1
	if Input.is_action_pressed("ui_right"):
		direction += 1
	if direction > 0:
		go_right()
	elif direction < 0:
		go_left()
	else:
		stop()
	if direction != 0:
		var pos = get_position()
		pos.x += speed * delta * direction
		pos = bound_pos(pos)
		position = pos

func go_left():
	flip_h = true
	anim.play("idle")
	direction = -1

func go_right():
	flip_h = false
	anim.play("idle")
	direction = 1

func stop():
	anim.play("sleep")
	direction = 0

func bound_pos(pos):
	if pos.x > get_viewport_rect().size.x:
		pos.x = get_viewport_rect().size.x
	elif pos.x < 0:
		pos.x = 0
	if pos.y > get_viewport_rect().size.y:
		pos.y = get_viewport_rect().size.y
	elif pos.y < 0:
		pos.y = 0
	return pos