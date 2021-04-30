extends Spatial

var error1 = true
var error2 = true
var error3 = true

onready var SimErroDois = $Botoes/SimErro2
onready var SimErroTres = $Botoes/SimErro3

onready var timer = $Timer

onready var erro1 = $Botoes/Erro1
onready var erro2 = $Botoes/Erro2
onready var erro3 = $Botoes/Erro3

onready var sim = $Botoes/Sim
onready var nao = $Botoes/Nao

onready var frase = $Botoes/Label
onready var sucesso = $Botoes/Label2
onready var falha = $Botoes/Label3

onready var tela = $Botoes/ColorRect

var numerodoerro
var funcaorandomica = RandomNumberGenerator.new()

func _ready():
	funcaorandomica.randomize()
	numerodoerro = funcaorandomica.randi_range(1, 3)
	print(numerodoerro)

	tela.visible = false
	sim.visible = false
	SimErroDois.visible = false
	SimErroTres.visible = false
	nao.visible = false
	frase.visible = false
	sucesso.visible = false
	erro1.visible = false
	erro2.visible = false
	erro3.visible = false
	falha.visible = false
	
	error1 = false
	error2 = false
	error3 = false
	
	

func errorUm():
	erro1.visible = true
	error1 = true

func errorDois():
	erro2.visible = true
	error2 = true
	
func errorTres():
	erro3.visible = true
	error3 = true

func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			tela.visible = true
			sim.visible = true
			nao.visible = true
			frase.visible = true
			


func _on_Sim_pressed():
	if error1 == true:
		sucesso.visible = true
		sim.visible = false
		nao.visible = false
		frase.visible = false
		timer.start()
		get_tree().reload_current_scene()
	else:
		SimErroDois.visible = false
		SimErroTres.visible = false
		sim.visible = false
		nao.visible = false
		frase.visible = false
		falha.visible = true
		timer.start()
		
func _on_Nao_pressed():
	tela.visible = false
	sim.visible = false
	nao.visible = false
	frase.visible = false


func _on_Timer_timeout():
	sucesso.visible = false
	tela.visible = false
	sim.visible = false
	SimErroDois.visible = false
	SimErroTres.visible = false
	frase.visible = false
	nao.visible = false
	falha.visible = false

func _on_AreaPlacaMae_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			tela.visible = true
			SimErroDois.visible = true
			nao.visible = true
			frase.visible = true


func _on_AreaHd_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			tela.visible = true
			SimErroTres.visible = true
			nao.visible = true
			frase.visible = true


func _on_SimErro2_pressed():
	if error2 == true:
		sucesso.visible = true
		SimErroDois.visible = false
		nao.visible = false
		frase.visible = false
		timer.start()
		get_tree().reload_current_scene()
	else:
		SimErroDois = false
		nao.visible = false
		sim.visible = false
		frase.visible = false
		falha.visible = true
		timer.start()

func _on_SimErro3_pressed():
	if error3 == true:
		sucesso.visible = true
		SimErroTres.visible = false
		nao.visible = false
		frase.visible = false
		timer.start()
		get_tree().reload_current_scene()
	else:
		print("Voce errou")
		SimErroTres.visible = false
		sim.visible = false
		nao.visible = false
		falha.visible = true
		frase.visible = false
		timer.start()
func _process(delta):


	if numerodoerro == 1:
		errorUm()

	if numerodoerro == 2:
		errorDois()

	if numerodoerro == 3:
		errorTres()

