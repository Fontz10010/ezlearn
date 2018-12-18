-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local width = display.contentWidth
local height = display.contentHeight
local fondo, volver
local C1
local push = audio.loadSound("Sound/boton.wav")
function oprimir(  )
local pushplay = audio.play(push)
	-- body
end

function select( event )
	-- body
	oprimir()
	composer.gotoScene("ort")
end

function Volver( event )
	-- body
	oprimir()
	composer.gotoScene("view3")
end

function scene:create( event )
	local sceneGroup = self.view
	fondo = display.newImageRect("Imagenes/Fondos/menuesp.PNG", display.contentWidth, display.contentHeight)
	fondo.anchorX = 0; fondo.anchorY = 0
	fondo.x = 0; fondo.y = 0
	sceneGroup:insert(fondo)

	C1 = display.newRect(width*0.27, height * 0.72, width* 0.42, width * 0.14)
	C1.anchorX = 0; C1.anchorY = 0
	C1.isVisible = false
	C1.isHitTestable = true

	volver = display.newImageRect("Imagenes/Volver.png",width * 0.15, height * 0.12)
	volver.anchorY = 0; volver.anchorX = 0
	volver.x = width * 0.85; volver.y = height * 0.1
	volver.id = "volver"

	sceneGroup:insert(volver)
	sceneGroup:insert(C1)
	C1:addEventListener("tap", select)
	
	volver:addEventListener("tap", Volver)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
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