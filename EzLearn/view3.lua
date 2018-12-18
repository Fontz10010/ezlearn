-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local width = display.contentWidth
local height = display.contentHeight
local fondo
local T1, T2, T3, T4
local volver
local push = audio.loadSound("Sound/boton.wav")
function oprimir(  )
local pushplay = audio.play(push)
	-- body
end

function selectMate( event )
	oprimir()
	composer.gotoScene("menuMate")
end

function selectEsp( event )
	-- body
	oprimir()
	composer.gotoScene("menuEsp")
end

function Volver( event )
	-- body
	oprimir()
	composer.gotoScene("view1")
end

function scene:create( event )
	local sceneGroup = self.view
	fondo = display.newImageRect("Imagenes/Fondos/fondojuegos.PNG", display.contentWidth, display.contentHeight)
	fondo.anchorX = 0; fondo.anchorY = 0
	fondo.x = 0; fondo.y = 0
	sceneGroup:insert(fondo)

	T1 = display.newRect(0, height * 0.30, width, height * 0.3)
	T1.anchorY = 0; T1.anchorX = 0
	T1:setFillColor(253/255, 205/255, 14/255)
	T1.path.y2 = -(height * 0.3)


	T2 = display.newRect(0, height * 0.34, width, height * 0.3)
	T2.anchorX = 0; T2.anchorY = 0
	T2.path.y4 = height * 0.3
	T2:setFillColor(58/255, 238/255, 76/255)

	T3 = display.newRect(0, height * 0.66, width, height * 0.3)
	T3.anchorY= 0; T3.anchorX = 0
	T3.path.y2 = -(height * 0.3)
	T3:setFillColor(60/255, 220/255, 200/255)

	T1.alpha = 0.1; T2.alpha = 0.1;-- T3.alpha = 0; 
	
	volver = display.newImageRect("Imagenes/Volver.png",width * 0.15, height * 0.12)
	volver.anchorY = 0; volver.anchorX = 0
	volver.x = width * 0.85; volver.y = height * 0.1

	sceneGroup:insert(volver)
	sceneGroup:insert(T1)
	sceneGroup:insert(T2)
	sceneGroup:insert(T3)
	T1:addEventListener("tap",selectMate)
	T2:addEventListener("tap", selectEsp)
	volver:addEventListener("tap",Volver)


	
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