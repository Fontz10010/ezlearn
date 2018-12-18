-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar( display.HiddenStatusBar )
local composer = require( "composer" )
local scene = composer.newScene()
local fondo; local iconoControl; local iconoTrofeo;
local titulo; local icoPersonalizar
local width = display.contentWidth;  local height = display.contentHeight
local OST = audio.loadStream( "Sound/OST.mp3" )
local OSTplay
local musicOn, musicOff
local push = audio.loadSound("Sound/boton.wav")
local sprite
function oprimir(  )
local pushplay = audio.play(push)
end
function MusicaActiva( event )
	if event.target.id == "musicOn" then
		musicOn.isVisible = false
		musicOff.isVisible = true
		audio.setVolume( 0, { channel=1 } )
	elseif event.target.id == "musicOff" then
		musicOn.isVisible = true
		musicOff.isVisible = false
		audio.setVolume( 1, { channel=1 } )
	end
end
function gotoJuegos( event )

	oprimir()
	composer.gotoScene("view3")
end
function gotoPersonalizar( event )
	oprimir()
	composer.gotoScene("view2")
end
function gotoLogros( event )
	oprimir()
	composer.gotoScene("view4")
end

function scene:create( event )
	local options =
		{
    		channel = 1,
    		loops = -1,
		}
	OSTplay = audio.play(OST,options);
	--local OSTv = audio.setVolume( 0.1 )
	
	local sceneGroup = self.view
	fondo = display.newImageRect("Imagenes/EzLearnFondo.png",display.contentWidth, display.contentHeight)
	fondo.anchorX = 0
	fondo.anchorY = 0
	sceneGroup:insert(fondo)
	
	musicOn = display.newImageRect("Imagenes/musicon.png",40,40)
	musicOn.anchorX = 0; musicOn.anchorY = 0
	musicOn.x = width*0.81
	musicOn.y = height*0.05
	musicOn.id = "musicOn"

	musicOff = display.newImageRect("Imagenes/musicoff.png",40,40)
	musicOff.anchorX = 0; musicOff.anchorY = 0
	musicOff.x = width*0.81
	musicOff.y = height*0.05
	musicOff.isVisible = false
	musicOff.id = "musicOff" 

	titulo = display.newImageRect("Imagenes/Titulo.png",240,100)
	titulo.anchorX = 0
	titulo.anchorY = 0
	titulo.x = width * .05
	sceneGroup:insert(titulo)

	iconoControl = display.newImageRect("Iconos/IcoGames.png",130,130)
	iconoControl.anchorY = 0
	iconoControl.anchorX = 0
	iconoControl.x = width * .385
	iconoControl.y = height * .3
	sceneGroup:insert(iconoControl)

	iconoTrofeo = display.newImageRect("Iconos/IcoTrofeo.png",100,100)
	iconoTrofeo.anchorY = 0; iconoTrofeo.anchorX = 0
	iconoTrofeo.x = width * .05
	iconoTrofeo.y = height * .65
	sceneGroup:insert(iconoTrofeo)

	icoPersonalizar = display.newImageRect("Iconos/IcoPerso.png",100,100)
	icoPersonalizar.anchorX = 0
	icoPersonalizar.anchorY = 0
	icoPersonalizar.x = width * 0.75
	icoPersonalizar.y = height * 0.65
	sceneGroup:insert(icoPersonalizar)
	sceneGroup:insert(musicOff)
	sceneGroup:insert(musicOn)



end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		musicOff:addEventListener("tap",MusicaActiva)
		musicOn:addEventListener("tap",MusicaActiva)
		iconoControl:addEventListener("tap",gotoJuegos)
		iconoTrofeo:addEventListener("tap",gotoLogros)
		icoPersonalizar:addEventListener("tap",gotoPersonalizar)
		-- Called when the scene is now on screen
		-- 
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
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	--Runtime:removeEventListener("",)
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