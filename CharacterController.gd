extends CharacterBody3D

var speed = 5.0
var mouse_sensitivity = 0.002

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
    var velocity = Vector3.ZERO

    if Input.is_action_pressed("move_forward"):
        velocity.z -= 1
    if Input.is_action_pressed("move_backward"):
        velocity.z += 1
    if Input.is_action_pressed("move_left"):
        velocity.x -= 1
    if Input.is_action_pressed("move_right"):
        velocity.x += 1

    velocity = velocity.normalized() * speed
    move_and_slide(velocity)

func _input(event):
    if event is InputEventMouseMotion:
        rotate_y(-event.relative.x * mouse_sensitivity)
        $Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
        $Camera3D.rotation_degrees.x = clamp($Camera3D.rotation_degrees.x, -90, 90)
