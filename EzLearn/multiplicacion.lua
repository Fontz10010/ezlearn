local composer = require("composer")
local scene  = composer.newScene()
local width = display.contentWidth
local height = display.contentHeight
display.setStatusBar( display.HiddenStatusBar )
--VARIABLES
local vidas = 3
local group = nil
local distanciaSuelo = display.contentHeight - 90
local respuestaCorrecta
local score = 0;
--VARIABLES IMG
--local cielo
--local nubes
--local montanas
--local suelo
local pausa
local myText
local rutaSprite
local barra
local corazon
local corazon2
local corazon3
local cuadro1
local cuadro2
local cuadro3
local cuadro4
local respuesta1
local respuesta2
local respuesta3
local respuesta4
local respuesta5
local resCorrecta
local scoreText
local pausaI
local botonReanudar
local botonSalir
--Animaciones.-
local animationExplosion
local animationVillano
local animation
local animationPerdio

function Reiniciar( )
	-- body
	score = 0
	scoreText.text = "SCORE: " .. score 
	vidas = 3
	corazon3.isVisible = true; 
	corazon2.isVisible = true;
	corazon.isVisible = true;
	--Problema()
end

function Pausa( event )
pausaI.isVisible = true
--pausaI.alpha = 0.2
botonSalir.isVisible = true
botonSalir.alpha = 0.01
botonReanudar.isVisible = true
botonReanudar.alpha = 0.01
end


function Reanudar( event )
	pausaI.isVisible = false
	botonReanudar.isVisible = false
	botonSalir.isVisible = false	 
end

function Salir( event )
	pausaI.isVisible = false
	botonReanudar.isVisible = false
	botonSalir.isVisible = false	 
	composer.recycleOnSceneChange = true
	composer.gotoScene("view3")
end

function scene:create( event )
		local path = system.pathForFile( "myfile.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "r" )
 
	if not file then		
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
    rutaSprite = "Characters MV/3_101_101.png"
	else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    --print( "Contents of " .. path .. "\n" .. contents .. "rrrrrrrrr")
    rutaSprite = contents
    -- Close the file handle
    io.close( file )
	end
 
		file = nil


    local sceneGroup = self.view
    group = display.newGroup( )
	local cielo = display.newImageRect("Imagenes/Background/CloudsBack.png",display.contentWidth,display.contentHeight)
	cielo.anchorX = 0
	cielo.anchorY = 0
	cielo.x = 0; cielo.y = 0

	local nubes = display.newImageRect("Imagenes/Background/CloudsFront.png",display.contentWidth,display.contentHeight)
	nubes.anchorX = 0
	nubes.anchorY = 0
	nubes.x = 0; nubes.y = 0

	local montanas = display.newImageRect("Imagenes/Background/BGBack.png",display.contentWidth,display.contentHeight)
	montanas.anchorX = 0
	montanas.anchorY = 0
	montanas.x = 0; montanas.y = 0

	local suelo = display.newImageRect("Imagenes/Background/BGFront.png",display.contentWidth,display.contentHeight)
	suelo.anchorX = 0
	suelo.anchorY = 0
	suelo.x = 0; suelo.y = 0
	
	sceneGroup:insert(cielo)
	sceneGroup:insert(nubes)
	sceneGroup:insert(montanas)
	sceneGroup:insert(suelo)

	


		--Text
	myText = display.newText( "Hello", 0, 0, native.systemFont, 32 )
	myText.x = 25; myText.y = 100
	myText:setFillColor( 1, 1, 1 )
	myText.anchorX = 0
	myText.text = "¡ES HORA DE MULTIPLICAR!" 

	barra = display.newRect(0, 0, display.contentWidth, 50)
	barra.anchorX = 0; barra.anchorY = 0; barra.alpha = 0.5
	barra.x = 0; barra.y = 0
	 
	corazon = display.newImageRect("Imagenes/heart.png", 35,35)
	corazon.anchorX = 0; corazon.anchorY = 0
	corazon.x = 10; corazon.y = 10

	corazon2 = display.newImageRect("Imagenes/heart.png", 35,35)
	corazon2.anchorX = 0; corazon2.anchorY = 0
	corazon2.x = 45; corazon2.y = 10

	corazon3 = display.newImageRect("Imagenes/heart.png", 35,35)
	corazon3.anchorX = 0; corazon3.anchorY = 0
	corazon3.x = 80; corazon3.y = 10

	cuadro1 = display.newRect(0,0, 75, 75)
	cuadro1.anchorX = 0; cuadro1.anchorY = 0; cuadro1.alpha = 0.5
	cuadro1.x = 20; cuadro1.y = display.contentHeight - 50

	cuadro2 = display.newRect(0,0, 75, 75)
	cuadro2.anchorX = 0; cuadro2.anchorY = 0; cuadro2.alpha = 0.5
	cuadro2.x = 135; cuadro2.y = display.contentHeight - 50

	cuadro3 = display.newRect(0,0, 75, 75)
	cuadro3.anchorX = 0; cuadro3.anchorY = 0; cuadro3.alpha = 0.5
	cuadro3.x = 270; cuadro3.y = display.contentHeight - 50

	cuadro4 = display.newRect(0,0, 75, 75)
	cuadro4.anchorX = 0; cuadro4.anchorY = 0; cuadro4.alpha = 0.5
	cuadro4.x = 385; cuadro4.y = display.contentHeight - 50
	------------------

	respuesta1 = display.newText( "A", 0, 0, native.systemFont, 40 )
	respuesta1.anchorX = 0; respuesta1.anchorY = 0
	respuesta1.x = 30; respuesta1.y = display.contentHeight - 50; respuesta1:setFillColor(0)

	respuesta2 = display.newText( "A", 0, 0, native.systemFont, 40 )
	respuesta2.anchorX = 0; respuesta2.anchorY = 0
	respuesta2.x = 145; respuesta2.y = display.contentHeight - 50; respuesta2:setFillColor(0)

	respuesta3 = display.newText( "A", 0, 0, native.systemFont, 40 )
	respuesta3.anchorX = 0; respuesta3.anchorY = 0
	respuesta3.x = 280 respuesta3.y = display.contentHeight - 50; respuesta3:setFillColor(0)

	respuesta4 = display.newText( "A", 0, 0, native.systemFont, 40 )
	respuesta4.anchorX = 0; respuesta4.anchorY = 0
	respuesta4.x = 395; respuesta4.y = display.contentHeight - 50; respuesta4:setFillColor(0)

	respuesta5 = display.newText( "A", 0, 0, native.systemFont, 40 )
	respuesta5.anchorX = 0; respuesta5.anchorY = 0
	respuesta5.x = 395; respuesta5.y = display.contentHeight - 200; respuesta5:setFillColor(0)
	respuesta5.isVisible = false

	resCorrecta = display.newText( "", 0, 0, native.systemFont, 40 )
	resCorrecta.isVisible = false



	pausaI = display.newImageRect("Imagenes/Fondos/Pausa.PNG",width,height)
	pausaI.anchorY = 0
	pausaI.anchorX = 0
	pausaI.isVisible = false

	botonReanudar = display.newRect(width*0.218,height*0.34, width*0.576,height*0.201)
	botonReanudar.anchorX = 0
	botonReanudar.anchorY = 0
	botonReanudar.isVisible = false
	

	botonSalir = display.newRect(width*0.218,height*0.64, width*0.576,height*0.201)
	botonSalir.anchorY = 0
	botonSalir.anchorX = 0
	botonSalir.alpha = false
	

		respuesta1.isVisible = false
		respuesta2.isVisible = false
		respuesta3.isVisible = false
		respuesta4.isVisible = false

	sceneGroup:insert(myText)
	sceneGroup:insert(barra)
	sceneGroup:insert(corazon)
	sceneGroup:insert(corazon2); sceneGroup:insert(corazon3)
	sceneGroup:insert(cuadro1); sceneGroup:insert(cuadro2)
	sceneGroup:insert(cuadro3); sceneGroup:insert(cuadro4)
	sceneGroup:insert(respuesta1); sceneGroup:insert(respuesta2)
	sceneGroup:insert(respuesta3); sceneGroup:insert(respuesta4)
	sceneGroup:insert(respuesta5); sceneGroup:insert(resCorrecta)
	
	--SPRITES

	------------------------------
	local sheetDataAcciones={
		width=64,
		height=64,
		numFrames=54,
		sheetContentWidth=576,
		sheetContentHeight=384
	}

	local mySheetAcciones = graphics.newImageSheet(rutaSprite, sheetDataAcciones)
	local sequenceDataAcciones={
		{name = "perdio", frames={26,27,28,35,36,37,44,45,46,52,53,54}, time = 2500, loopCount = 1}
	}

	animationPerdio = display.newSprite(mySheetAcciones, sequenceDataAcciones)
	animationPerdio.x = display.contentWidth/2
	animationPerdio.y = distanciaSuelo
	animationPerdio.height = 48
	animationPerdio.width = 48
	animationPerdio.isVisible=false
	animationPerdio:scale(-1,1)
	sceneGroup:insert(animationPerdio)
	-------------------------------

	local sheetData={
		width=64,
		height=64,
		numFrames=54,
		sheetContentWidth=576,
		sheetContentHeight=384
	}

	local mySheet = graphics.newImageSheet(rutaSprite, sheetData)
	local sequenceData={
		{name = "caminarDerecha", frames={9,8,7,6,5,4,3,2,1,18,17,16,15,14,13,12,11,10,27,26,25,24,23,22}, time = 4500},
		{name = "daño", frames={26,27,28}, time=700, loopCount = 1}
	}

	animation = display.newSprite(mySheet, sequenceData)
	animation.x = 50
	animation.y = distanciaSuelo
	animation:scale(-1,1)
	animation:play()
	sceneGroup:insert(animation)
	------------------------------


	local sheetDataExplosion={
		width=100,
		height=100,
		numFrames=80,
		sheetContentWidth=1000,
		sheetContentHeight=800
	}

	local mySheetExplosion = graphics.newImageSheet("Imagenes/explosion.png", sheetDataExplosion)
	local sequenceDataExplosion={
		{name = "explosion", start=1, count =80, time = 700, loopCount = 1}
	}

	animationExplosion = display.newSprite(mySheetExplosion, sequenceDataExplosion)
	animationExplosion.x = 50
	animationExplosion.y = distanciaSuelo
	animationExplosion.isVisible = false

	sceneGroup:insert(animationExplosion)

	-----------------------------
	local sheetDataVillano={
		width=64,
		height=64,
		numFrames=54,
		sheetContentWidth=576,
		sheetContentHeight=384
	}

	local mySheetVillano = graphics.newImageSheet("Imagenes/villano.png", sheetDataVillano)
	local sequenceDataVillano={
		{name = "perdio", start=1, count =24, time = 4500}
	}

	animationVillano = display.newSprite(mySheetVillano, sequenceDataVillano)
	animationVillano.x = display.contentWidth - 50
	animationVillano.y = distanciaSuelo
	animationVillano.height = 48
	animationVillano.width = 48
	animationVillano:play()
	sceneGroup:insert(animationVillano)
	scoreText = display.newText( "Hello", 0, 0, native.systemFont, 32 )
	scoreText.x = 125; scoreText.y = 25
	scoreText:setFillColor( 1, 1, 1 )
	scoreText.anchorX = 0
	scoreText.text = "SCORE: 0" 
	sceneGroup:insert(scoreText)
	pausa = display.newImageRect("Imagenes/Pausa.png",40,40)
	pausa.anchorX = 0; pausa.anchorY = 0
	pausa.x = width * 0.87
	pausa.y = height * 0.01
	sceneGroup:insert(pausa)
	sceneGroup:insert(pausaI)

	pausa:addEventListener("tap", Pausa)
	respuesta1:addEventListener("tap", Comprobar)
	respuesta2:addEventListener("tap", Comprobar)
	respuesta3:addEventListener("tap", Comprobar)
	respuesta4:addEventListener("tap", Comprobar)
	botonSalir:addEventListener("tap",Salir)	
	botonReanudar:addEventListener("tap",Reanudar)
end

--FUNCIONES
function Perder(  )
	composer.recycleOnSceneChange = true
	composer.gotoScene("lose")
--	composer.showOverlay("lose")
		-- body
end

function Problema(  )
	print("3ntreee")
	local a = math.random(1,10)
	local b = math.random(1,10)
	respuesta1.isVisible = true
	respuesta2.isVisible = true
	respuesta3.isVisible = true
	respuesta4.isVisible = true
	respuestaCorrecta = a * b
	resCorrecta.text = respuestaCorrecta
	myText.text = a .. "*" .. b
	local posicion = math.random(1,4)
	if posicion == 1 then
		respuesta1.text = respuestaCorrecta
		respuesta2.text =  math.random(1,respuestaCorrecta)
		respuesta3.text =  math.random(1,respuestaCorrecta)
		respuesta4.text =  math.random(1,respuestaCorrecta)
	elseif posicion == 2 then
		respuesta2.text = respuestaCorrecta 
		respuesta1.text =  math.random(1,respuestaCorrecta)
		respuesta3.text =  math.random(1,respuestaCorrecta)
		respuesta4.text =  math.random(1,respuestaCorrecta)
	elseif posicion == 3 then
		respuesta3.text = respuestaCorrecta
		respuesta2.text =  math.random(1,respuestaCorrecta)
		respuesta1.text =  math.random(1,respuestaCorrecta)
		respuesta4.text =  math.random(1,respuestaCorrecta)
	elseif posicion == 4 then
		respuesta4.text = respuestaCorrecta
		respuesta2.text =  math.random(1,respuestaCorrecta)
		respuesta3.text =  math.random(1,respuestaCorrecta)
		respuesta1.text =  math.random(1,respuestaCorrecta)
	end
end

function Comprobar( event )
	if pausaI.isVisible == false then

		local respuesta = event.target.text
	respuesta5.text = respuesta
	if resCorrecta.text == respuesta5.text then
	print("ganaste!")
	score = score + 10
	scoreText.text = "SCORE: " .. score 
	Problema()
	else 
		vidas = vidas - 1
		print("perdiste una vida")
		animationExplosion:play()
		animationExplosion.isVisible=true
		--animation:setSequence("daño")
		--animation:play()
		if vidas == 3 then
			corazon.isVisible = true; corazon2.isVisible = true; corazon3.isVisible = true;
		elseif vidas == 2 then
			corazon.isVisible = true; corazon2.isVisible = true; corazon3.isVisible = false;
		elseif vidas == 1 then
			corazon.isVisible = true; corazon2.isVisible = false; corazon3.isVisible = false;
		elseif vidas == 0 then
			corazon.isVisible = false; corazon2.isVisible = false; corazon3.isVisible = false;
			myText.text = "PERDISTE"
			respuesta1.isVisible = false
			respuesta2.isVisible = false
			respuesta3.isVisible = false
			respuesta4.isVisible = false
			animation:pause() 
			animation.isVisible = false; 
			animationPerdio.isVisible=true
			animationPerdio:play()
			local scoreanterior
			local path = system.pathForFile( "scoremulti.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "r" )
 
	if not file then		
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
    scoreanterior = 0
	else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    --print( "Contents of " .. path .. "\n" .. contents .. "rrrrrrrrr")
    scoreanterior = tonumber(contents)
    -- Close the file handle
    io.close( file )
	end
 
		file = nil

			if score > scoreanterior then
					-- Path for the file to write
		 path = system.pathForFile( "scoremulti.txt", system.DocumentsDirectory )
 
-- Open the file handle
		 file, errorString = io.open( path, "w" )
 
		if not file then
    -- Error occurred; output the cause
    				print( "File error: " .. errorString )
		else
    -- Write data to file
    		file:write( score )
    -- Close the file handle
    		io.close( file )
		end
 
		file = nil
			end
			--guardar score
							



			--
			timer.performWithDelay(3000, Perder, 1)
		end
		
	end

	end
	
end
----------------------------
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
    if phase == "will" then
		print("will")
    elseif phase == "did" then
    	print("did")
    	Reiniciar( )
    end 
end



function start( event )
	if event.phase == "began" then
		storyboard.gotoScene("","fade",400)
	end
	-- body
end

function scene:enter( event )
	
	-- body

	--scene:removeSelf()
end

function scene:destroy( event )
	-- body
	--Runtime:removeEventListener("",)
	--scene:removeSelf()
	--timer:removeSelf()
end
	

--myText:addEventListener("tap",problema)

timer.performWithDelay(3000,Problema,1)


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene