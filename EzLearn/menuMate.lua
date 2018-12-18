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
local C1, C2, C3, C4
local push = audio.loadSound("Sound/boton.wav")
function oprimir(  )
local pushplay = audio.play(push)
	-- body
end

function select( event )
	-- body
	oprimir()
	print(event.target.id)
	if event.target.id == "sumas" then
		composer.gotoScene("sumas")
	elseif event.target.id == "restas"then
		composer.gotoScene("restas")
	elseif event.target.id == "multiplicacion" then
		composer.gotoScene("multiplicacion")
	elseif event.target.id == "division" then
	elseif event.target.id == "volver" then
		composer.gotoScene("view3")
	end
end

function scene:create( event )
	local sceneGroup = self.view
	fondo = display.newImageRect("Imagenes/Fondos/menumatematicas.PNG", display.contentWidth, display.contentHeight)
	fondo.anchorX = 0; fondo.anchorY = 0
	fondo.x = 0; fondo.y = 0
	sceneGroup:insert(fondo)
	C1 = display.newRect(width*0.015, height * 0.41, width* 0.195, width * 0.23)
	C1.anchorX = 0; C1.anchorY = 0
	C1.isVisible = false
	C1.isHitTestable = true
	C1.id = "sumas"
	
	C2 = display.newRect(width*0.295, height * 0.725, width* 0.1722, width * 0.2)
	C2.anchorX = 0; C1.anchorY = 0
	C2.isVisible = false
	C2.isHitTestable = true
	C2.id = "restas"

	C3 = display.newRect(width*0.545, height * 0.795, width* 0.2, width * 0.25)
	C3.anchorX = 0; C1.anchorY = 0
	C3.isVisible = false
	C3.isHitTestable = true
	C3.id = "multiplicacion"

	C4 = display.newRect(width*0.82, height * 0.765, width* 0.16, width * 0.18)
	C4.anchorX = 0; C1.anchorY = 0
	C4.isVisible = false
	C4.isHitTestable = true
	C4.id = "division"


	local candado = display.newImageRect("Imagenes/CANDADO.png",width * 0.20, height * 0.25)
	candado.anchorX = 0
	candado.anchorY = 0
	candado.x = width*0.805
	candado.y = height * 0.63

	sceneGroup:insert(candado)
	volver = display.newImageRect("Imagenes/Volver.png",width * 0.15, height * 0.12)
	volver.anchorY = 0; volver.anchorX = 0
	volver.x = width * 0.85; volver.y = height * 0.1
	volver.id = "volver"

	sceneGroup:insert(volver)
	sceneGroup:insert(C1); sceneGroup:insert(C2)
	sceneGroup:insert(C3); sceneGroup:insert(C4)
	C1:addEventListener("tap", select)
	C2:addEventListener("tap", select)
	C3:addEventListener("tap", select)
	C4:addEventListener("tap",select)
	volver:addEventListener("tap",select)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		fondo.isVisible = true
		volver.isVisible  = true
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		fondo.isVisible = false
		fondo.isVisible = false
		
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