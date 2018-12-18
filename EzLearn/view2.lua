local composer = require( "composer" )
local scene = composer.newScene()
display.setStatusBar( display.HiddenStatusBar )
local contador = 101
local distanciaImagePerfil = display.contentWidth * .45
local width = display.contentWidth
local height = display.contentHeight
--VARIABLES
local ruta; local rutaD; local rutaI
local rutaSprite
local imagePerfil; local imagePerfilD; local imagePerfilI
local botonIzq; local botonDer
local animation
local sheetData
local mySheet
local volver
local guardarBtn
local sequenceData
local imageP = {}
local musica
local push = audio.loadSound("Sound/boton.wav")
function oprimir(  )
local pushplay = audio.play(push)
	-- body
end
function regresar( event )
	-- body		
	oprimir()
	animation.isVisible = false
		for count = 1,15 do
        	imageP[count].isVisible = false
        	--imageP[count].isVisible = false
        end
	composer.gotoScene("view1")
		
end
function Guardar( event )
	oprimir()
	-- Data (string) to write
local saveData = rutaSprite
 
-- Path for the file to write
local path = system.pathForFile( "myfile.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "w" )
 
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Write data to file
    file:write( saveData )
    -- Close the file handle
    io.close( file )
end
 
file = nil
	-- body
end


function CambiarAnimacion( event )
	animation:removeSelf()
	rutaSprite = "Characters MV/3_" .. event.target.id .."_"..event.target.id..".png"
	sheetData={
		width=64,
		height=64,
		numFrames=54,
		sheetContentWidth=576,
		sheetContentHeight=384
	}

	mySheet = graphics.newImageSheet(rutaSprite, sheetData)
	sequenceData={
		{name = "caminar", start=1, count =54, time = 10000, loop = -1}
	}

	animation = display.newSprite(mySheet, sequenceData)
	animation.x = width * 0.83
	animation.y = display.contentHeight * .53
	--animation:scale(-1,1)
	animation:play()
end


--FUNCIONES
function scene:create( event )
 
    local sceneGroup = self.view
    local ids = {"195","193","192","190","188","178","129","173","160","152","141","148","138","114","101"}
    
    local parametros = {	{width*0.037,height*0.322}, {width*0.162,height*0.322}, {width*0.293,height*0.322}, {width*0.416,height*0.322}, {width*0.552,height*0.322},
    						{width*0.037,height*0.53}, {width*0.162,height*0.53}, {width*0.293,height*0.53}, {width*0.419,height*0.53}, {width*0.552,height*0.53},
    						{width*0.041,height*0.73}, {width*0.162,height*0.73}, {width*0.293,height*0.73}, {width*0.422,height*0.73}, {width*0.552,height*0.73},
    						
    					}
    for count = 1,15 do
    	imageP[count] = display.newImageRect("Characters MV/1_" .. ids[count] .."_"..ids[count]..".png",43,43)
    	imageP[count].anchorX = 0; imageP[count].anchorY = 0
    	imageP[count].x = parametros[count][1]
    	imageP[count].y = parametros[count][2]
    	imageP[count].id = ids[count]
    	imageP[count]:addEventListener("tap",CambiarAnimacion)
    end

	fondo = display.newImageRect("Imagenes/Fondos/fondoperfil2.PNG",display.contentWidth, display.contentHeight)
	fondo.anchorY=0; fondo.anchorX = 0
	fondo.x = 0; fondo.y = 0
	sceneGroup:insert(fondo)
	local  contador2 = "101"
	rutaSprite = "Characters MV/3_" .. contador2 .."_"..contador2..".png"
	sheetData={
		width=64,
		height=64,
		numFrames=54,
		sheetContentWidth=576,
		sheetContentHeight=384
	}

	mySheet = graphics.newImageSheet(rutaSprite, sheetData)
	sequenceData={
		{name = "caminar", start=1, count =54, time = 10000, loop = -1}
	}

	animation = display.newSprite(mySheet, sequenceData)
	animation.x = width * 0.83
	animation.y = display.contentHeight * .53
	animation:play()
	--sceneGroup:insert(animation)

	guardarBtn = display.newRect(width * 0.74, height * 0.824, width * 0.16, height * 0.12)
	guardarBtn.anchorX = 0
	guardarBtn.anchorY = 0
	guardarBtn.isVisible = false
	guardarBtn.isHitTestable = true
	guardarBtn:addEventListener("tap", Guardar)


	volver = display.newImageRect("Imagenes/Volver.png",width * 0.15, height * 0.12)
	volver.anchorY = 0; volver.anchorX = 0
	volver.x = width * 0.85; volver.y = height * 0.1

	sceneGroup:insert(volver)

	volver:addEventListener("tap", regresar)
	--btnRegresar:addEventListener("tap",regresar)
	
	
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
    	animation.isVisible = true
		for count = 1,15 do
        	imageP[count].isVisible = true
        	--imageP[count].isVisible = false
        end
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    	animation:removeSelf()

    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene
--,,,,,,,,,,,,,

