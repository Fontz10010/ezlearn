local composer = require( "composer" )
local scene = composer.newScene()
local width = display.contentWidth
local height = display.contentHeight

local  fondo
local nivelText
local input
local j 
local imagen 
local silaba={}
local nivel={}
local level
local imgLevelMenu
local pausa
local respuesta
local pausaI
local botonReanudar
local candado = {}
local botonSalir
local volver
local retorno
local comprobado
local t ={}
local sceneGroup 
local mSilaba = {"la","va","ta","cha","vo","re","pe","rro"}
local switch = 0
local i 
local numSilabas=0
local parametros = {}
-----------------------------------------------------------------------------------------
local mPalabras = {
	{"pan","pan","","",""},
	{"coco","co","co","",""},
	{"leche","le","che","",""},
	{"manzana","man","za","na",""},
	{"naranja","na","ran","ja",""},
	{"estrella","es","tre","lla",""},
	{"espárragos","es","pá","rra","gos"}
}
-----------------------------------------------------------------------------------------
function Pausar( event )
	-- body
	pausaI.isVisible = true
	botonSalir.isHitTestable = true
	botonReanudar.isHitTestable = true
	pausa.isVisible = false
	-----
	for count = 1,6 do
	silaba[count].isVisible = false
	silaba[count].isHitTestable  = false
	end
	pausaI:toFront()
end

function VolverMenu( event )
	-- body
	composer.gotoScene("menuEsp")
	composer.recycleOnSceneChange = true
end

function Salir( event )
	-- body
	pausaI.isVisible = false
	botonReanudar.isVisible = false
	botonSalir.isVisible = false	 
	composer.recycleOnSceneChange = true
	composer.gotoScene("view3")
end

function Reanudar( event )
	-- body
	pausaI.isVisible = false
	botonSalir.isHitTestable = false
	pausa.isVisible = true
	botonReanudar.isHitTestable = false
		for count = 1,6 do
	silaba[count].isVisible = true
	silaba[count].isHitTestable  = true
	end
end

function seleccionarLevel( event )
	i = event.target.id
	nivelText.text = "Nivel " .. i
	sceneGroup:insert(nivelText)
	volver.isVisible = false
	for count = 1,7 do
		nivel[count].isHitTestable = false
		
		--imgLevelMenu.isVisible = false
	end
	--imagen.isVisible = false

if imgLevelMenu ~= nil then
	print("hh")
	imgLevelMenu.isVisible = false
end
---------------

	imagen = display.newImageRect("Imagenes/characters/characters_000"..i..".png",75,75);
	imagen.anchorX = 0; imagen.anchorY = 0
	imagen.x = display.contentWidth /2 ; imagen.y = 10
	sceneGroup:insert(imagen)

parametros = {	{width*0.1,height/3},
						{width*0.4, height/3},
						{width*0.75, height/3},
						{width*0.1,height*0.2},
						{width*0.4,height*0.2},
						{width*0.75,height*0.2}}

for count = 1,7 do
	candado[count].isVisible = false
end

for count = 1,6 do
--QUE SALGA DE FORMA ALEATORIA LOS TEXTOS
--LIMITAR A UN USO POR PALABARA PARA QUE NO SIGA ESCRIBIENDO
--FUNCION DE BORRADOR DE PALABRA
--FUNCION DE SELECCIONAR NIVEL EN VEZ DEL RANDOM
silaba[count] = display.newText( "Hello", 0, 0, native.systemFontBold, 19 )
silaba[count].text = mPalabras[i][count+1]
--silaba[count].x = parametros[count][1]
--silaba[count].y = parametros[count][2]
silaba[count].id = count
silaba[count]:setFillColor( 1, 1, 1 )
silaba[count].anchorX = 0;
	if silaba[count].text == "" then
		local rand = math.random(1,8)
		silaba[count].text = mSilaba[rand]
	end
sceneGroup:insert(silaba[count])
silaba[count]:addEventListener("tap",agregar)
end
	local rnd = math.random(1,3)
if rnd == 1 then
	silaba[1].x = parametros[1][1]; silaba[1].y = parametros[1][2]
	silaba[2].x = parametros[3][1]; silaba[2].y = parametros[3][2]
	silaba[3].x = parametros[5][1]; silaba[3].y = parametros[5][2]
	silaba[4].x = parametros[2][1]; silaba[4].y = parametros[2][2]
	silaba[5].x = parametros[4][1]; silaba[5].y = parametros[4][2]
	silaba[6].x = parametros[6][1]; silaba[6].y = parametros[6][2]
elseif rnd == 2 then
	silaba[1].x = parametros[3][1]; silaba[1].y = parametros[3][2]
	silaba[2].x = parametros[2][1]; silaba[2].y = parametros[2][2]
	silaba[3].x = parametros[1][1]; silaba[3].y = parametros[1][2]
	silaba[4].x = parametros[4][1]; silaba[4].y = parametros[4][2]
	silaba[5].x = parametros[6][1]; silaba[5].y = parametros[6][2]
	silaba[6].x = parametros[5][1]; silaba[6].y = parametros[5][2]
elseif rnd == 3 then
	silaba[1].x = parametros[6][1]; silaba[1].y = parametros[6][2]
	silaba[2].x = parametros[5][1]; silaba[2].y = parametros[5][2]
	silaba[3].x = parametros[3][1]; silaba[3].y = parametros[3][2]
	silaba[4].x = parametros[1][1]; silaba[4].y = parametros[1][2]
	silaba[5].x = parametros[2][1]; silaba[5].y = parametros[2][2]
	silaba[6].x = parametros[4][1]; silaba[6].y = parametros[4][2]
end
	

	--------------
end

function agregar( event )
	if comprobado.text == "" then 
		silaba[event.target.id].isVisible = false 
		if switch == 0 then
			local res = event.target.text
			respuesta.text = respuesta.text .. res
				if respuesta.text == mPalabras[i][1] then
				comprobado = display.newText( "", 0, 0, native.systemFontBold, 19 )
				comprobado.x = 20; comprobado.y = display.contentHeight - 20
				comprobado:setFillColor( 0, 1, 1 )
				comprobado.anchorX = 0
				comprobado.text = "Correcto"
				t[i+1] = "1"
				niveles = ""
				for count = 1,7 do
						niveles = niveles ..t[count].." "
				end
				print(niveles)
				local path = system.pathForFile( "ortniveles.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "w" )
 
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Write data to file
    file:write( niveles )
    -- Close the file handle
    io.close( file )
end
 
file = nil
				sceneGroup:insert(comprobado)
				i = i+1
				switch = 1
				timer.performWithDelay(3000, VolverMenu, 1)
			end
		end
	end
	print("rrr")
	
	
end

function retornar( event )
	if comprobado.text == "" then
	for count = 1,6 do
		silaba[count].isVisible = true
	end
	respuesta.text = ""
	-- body
	end
	
end


function scene:create( event )
sceneGroup = self.view
local niveles
 --to read
local path = system.pathForFile( "ortniveles.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "r" )
 
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )

    --CERAR ARCHIVO
    file, errorString = io.open( path, "w" )
 
		if not file then
    -- Error occurred; output the cause
    		print( "File error: " .. errorString )
		else
    -- Write data to file
    		file:write( "1 0 0 0 0 0 0" )
    		niveles = "1 0 0 0 0 0 0"
    -- Close the file handle
    		io.close( file )
		end
 
		
    ------------------
else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    --print( "Contents of " .. path .. "\n" .. contents .. "rrrrrrrrr")
    niveles = contents
    -- Close the file handle
    io.close( file )
end
 
file = nil







input = "1 1 1 0 0 0 0"
local j = 1
for token in string.gmatch(niveles, "[^%s]+") do
   t[j] = token
   print(t[j])
   j = j + 1
end


fondo = display.newImageRect("Imagenes/fondo.png",width,height)
fondo.anchorX = 0; fondo.anchorY = 0
fondo.x = 0; fondo.y = 0
sceneGroup:insert(fondo)

nivelText = display.newText( "Nivel ", 0, 0, native.systemFontBold, 19 ) --display.newText( "Hello", 0, 0, "tiza.ttf", 19 )
nivelText.x = 1; nivelText.y = 10
nivelText:setFillColor( 1, 1, 1 )
nivelText.anchorX = 0
sceneGroup:insert(nivelText)


--Matriz trabajan de 1 a n, no de 0 a n


	


respuesta = display.newText( "", width /2, 3 * (height/4), native.systemFontBold, 19 )
--respuesta.x = display.contentWidth/3; respuesta.y = display.contentHeight * 0.8
respuesta:setFillColor( 1, 1, 1 )
respuesta.anchorX = 0
sceneGroup:insert(respuesta)
--respuesta.text = mPalabras[i][1]
--respuesta.isVisible = false
---------
comprobado = display.newText( "", 0, 0, native.systemFontBold, 19 )
sceneGroup:insert(comprobado)

retorno = display.newImageRect("Imagenes/Retorno.png", width * 0.09, width * 0.09)
retorno.x =  width * 0.7
retorno.y = height * 0.57
retorno.anchorY = 0
retorno.anchorX = 0 
retorno:addEventListener("tap", retornar)
sceneGroup:insert(retorno)
--[[silaba1:addEventListener("tap", agregar)
silaba2:addEventListener("tap", agregar)
silaba3:addEventListener("tap", agregar)
silaba4:addEventListener("tap", agregar)
silaba5:addEventListener("tap", agregar)
silaba6:addEventListener("tap", agregar)
]]

	pausaI = display.newImageRect("Imagenes/Fondos/Pausa.PNG",width,height)
	pausaI.anchorY = 0
	pausaI.anchorX = 0
	pausaI.isVisible = false
	sceneGroup:insert(pausaI)

	botonReanudar = display.newRect(width*0.218,height*0.34, width*0.576,height*0.201)
	botonReanudar.anchorX = 0
	botonReanudar.anchorY = 0
	botonReanudar.isVisible = false
	botonReanudar:addEventListener("tap", Reanudar)
	sceneGroup:insert(botonReanudar)

	botonSalir = display.newRect(width*0.218,height*0.64, width*0.576,height*0.201)
	botonSalir.anchorY = 0
	botonSalir.anchorX = 0
	botonSalir.isVisible = false
	botonSalir:addEventListener("tap", Salir)
	sceneGroup:insert(botonSalir)

	pausa = display.newImageRect("Imagenes/Pausa.png",40,40)
	pausa.anchorX = 0; pausa.anchorY = 0
	pausa.x = width * 0.87
	pausa.y = height * 0.01
	pausa:addEventListener("tap", Pausar)
	sceneGroup:insert(pausa)

local prm = {
			{width * 0.013, height * 0.375 }, --1
			{width * 0.15, height * 0.565 }, --2
			{width * 0.275, height * 0.375 }, --3
			{width * 0.41, height * 0.565 }, --4
			{width * 0.543, height * 0.375 }, --5
			{width * 0.676, height * 0.565 }, --6
			{width * 0.81, height * 0.375 } --7
			}	
imgLevelMenu = display.newImageRect("Imagenes/Fondos/fondoLevel.PNG", width, height)
imgLevelMenu.anchorX = 0
imgLevelMenu.anchorY = 0
sceneGroup:insert(imgLevelMenu)

nivel = {}
for count = 1,7 do
	nivel[count] = display.newRect(prm[count][1],prm[count][2] ,50,50);
	nivel[count].id = count
	nivel[count].anchorY = 0
	nivel[count].anchorX = 0
	nivel[count].isVisible = false
	nivel[count].isHitTestable = true
	nivel[count]:addEventListener("tap",seleccionarLevel)	
	sceneGroup:insert(nivel[count])
	candado[count] = display.newImageRect("Imagenes/CANDADO.png",width * 0.12, height * 0.12)
	candado[count].anchorX = 0
	candado[count].anchorY=0
	candado[count].x = prm[count][1]
	candado[count].y = prm[count][2] + 0.2
	if t[count] == "1" then
			candado[count].isVisible = false
	else
		nivel[count].isHitTestable = false
	end

	sceneGroup:insert(candado[count])
	
end

	volver = display.newImageRect("Imagenes/Volver.png",width * 0.15, height * 0.12)
	volver.anchorY = 0; volver.anchorX = 0
	volver.x = width * 0.85; volver.y = height * 0.1
	volver:addEventListener("tap", VolverMenu)
	sceneGroup:insert(volver)

--[[
parametros = {	{width*0.1,height/3},
						{width*0.4, height/3},
						{width*0.75, height/3},
						{width*0.1,height*0.2},
						{width*0.4,height*0.2},
						{width*0.75,height*0.2}}
]]


end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen

	elseif phase == "did" then
		
		-- Called when the scene is now on screen
		
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
		pausa.isVisible = true
		respuesta = display.newText( "", width /2, 3 * (height/4), native.systemFontBold, 19 )
		respuesta.text = ""
		respuesta.isVisible = true
		imgLevelMenu.isVisible = true
		imgLevelMenu:toFront()
		comprobado.text = ""
		
		if imagen ~= nil then
			imagen.isVisible = false
		end
		if nivelText ~= nil then
			nivelText.text = ""
		end
		
		for count = 1,7 do
			if silaba[count] ~= nil then
				silaba[count].isVisible = false
				silaba[count].text = ""
			end
			if nivel[count] ~= nil then
				nivel[count].isHitTestable = true
			end
		end
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene