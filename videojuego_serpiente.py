import turtle
import time
import random

posponer = 0.1

#Marcador
score = 0
high_score = 0



#configuracion de la ventana
wn = turtle.Screen()
wn.title("Snake")
wn.bgcolor("black")
wn.setup(width = 600, height = 600)
wn.tracer(0)

#cabeza de serpiente
cabez = turtle.Turtle()
cabez.speed(0)
cabez.shape("square")
cabez.color("white")
cabez.penup()
cabez.goto(0,0)
cabez.direction = "stop"

#comida
comida = turtle.Turtle()
comida.speed(0)
comida.shape("circle")
comida.color("red")
comida.penup()
comida.goto(0,100)

#segmentos / cuerpo de la serpiente
segmentos = []

#texto
texto = turtle.Turtle()
texto.speed(0)
texto.color("white")
texto.penup()
texto.hideturtle()
texto.goto(0,260)
texto.write("score: 0       high Score 0", align = "center", font = ("Courier", 24, "normal"))



#funciones
def arriba():
    cabez.direction = "up"
def abajo():
    cabez.direction = "down"
def izquierda():
    cabez.direction = "left"
def derecha():
    cabez.direction = "right"


def mov():
    if cabez.direction == "up":
        y = cabez.ycor()
        cabez.sety(y + 20)

    if cabez.direction == "down":
        y = cabez.ycor()
        cabez.sety(y - 20)

    if cabez.direction == "left":
        x = cabez.xcor()
        cabez.setx(x - 20)

    if cabez.direction == "right":
        x = cabez.xcor()
        cabez.setx(x + 20)

#teclado
wn.listen()
wn.onkeypress(arriba, "Up")
wn.onkeypress(abajo, "Down")
wn.onkeypress(izquierda, "Left")
wn.onkeypress(derecha, "Right")
while True:
    wn.update()

    #Colisiones bordes
    if cabez.xcor() > 280 or cabez.xcor() <-290 or cabez.ycor() >280 or cabez.ycor() < -280:
        time.sleep(1)
        cabez.goto(0,0)
        cabez.direction = "stop"

        #Esconder los segmentos
        for segmento in segmentos:
            segmento.goto(10000,10000)

        #Limpiar lista de segmentos
        segmentos.clear()

        #resetear marcador
        score = 0
        texto.clear()
        texto.write("score: {}  high score: {}".format(score, high_score), align = "center", font =("courier", 24, "normal"))




    if cabez.distance(comida) < 20:
       x = random.randint(-280,280)
       y = random.randint(-280,280)
       comida.goto(x,y)

       nuevo_segmento = turtle.Turtle()
       nuevo_segmento.speed(0)
       nuevo_segmento.shape("square")
       nuevo_segmento.color("grey")
       nuevo_segmento.penup()
       segmentos.append(nuevo_segmento)

       #Aumentar marcador
       score += 10

       if score > high_score:
           high_score = score

    
       texto.clear()
       texto.write("score: {} high score: {}".format(score, high_score), align = "center", font =("courier", 24, "normal"))
       

        


    #Mover el cuerpo de la serpiente
    totalseg = len(segmentos)
    for index in range(totalseg -1, 0, -1):
        x = segmentos[index -1].xcor()
        y = segmentos[index - 1].ycor()
        segmentos[index].goto(x,y)

    if totalseg >0:
        x = cabez.xcor()
        y = cabez.ycor()
        segmentos[0].goto(x,y)


       
    mov()

    #Coliciones con el cuerpo
    for segmento in segmentos:
        if segmento.distance(cabez) < 20:
            time.sleep(1)
            cabez.goto(0,0)
            cabez.direction = "stop"
            #Esconder los segmentos
            for segmento in segmentos:
                segmento.goto(1000,1000)
                #Limpiar los elementos de la lista
                segmento.clear()
                

                #resetear marcador
                score = 0
        texto.clear()
        texto.write("score: {}  high score: {}".format(score, high_score), align = "center", font =("courier", 24, "normal"))


    time.sleep(posponer) 
    


