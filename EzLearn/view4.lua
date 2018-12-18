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
local push = audio.loadSound("Sound/boton.wav")
function oprimir(  )
local pushplay = audio.play(push)
	-- body
end

function regresar( event )
	-- body
	oprimir()
	composer.recycleOnSceneChange = true
	composer.gotoScene("view1")
end
function scene:create( event )
	local sceneGroup = self.view

 local scoresum
 local scorerest
 local scoremult


			local path = system.pathForFile( "scoresumas.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "r" )
 
	if not file then		
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
    scoresum = 0
	else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    --print( "Contents of " .. path .. "\n" .. contents .. "rrrrrrrrr")
    scoresum= tonumber(contents)
    -- Close the file handle
    io.close( file )
	end
 
	file = nil


	-------------------------

	path = system.pathForFile( "scorerest.txt", system.DocumentsDirectory )

-- Open the file handle
 file, errorString = io.open( path, "r" )
 
	if not file then		
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
    scorerest = 0
	else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    --print( "Contents of " .. path .. "\n" .. contents .. "rrrrrrrrr")
    scorerest= tonumber(contents)
    -- Close the file handle
    io.close( file )
	end
 
	file = nil

-----------------------------------

path = system.pathForFile( "scoremulti.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "r" )
 
	if not file then		
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
    scoremult = 0
	else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    --print( "Contents of " .. path .. "\n" .. contents .. "rrrrrrrrr")
    scoremult = tonumber(contents)
    -- Close the file handle
    io.close( file )
	end


	print(scoremult)
	print(scorerest)
	print(scoresum)


	--[[
	local scoresum
 local scorerest
 local scoremult]]
 
	file = nil
	fondo = display.newImageRect("Imagenes/Fondos/fondologros.png", display.contentWidth, display.contentHeight)
	fondo.anchorX = 0; fondo.anchorY = 0
	sceneGroup:insert(fondo)
	volver = display.newImageRect("Imagenes/Volver.png",width * 0.15, height * 0.12)
	volver.anchorY = 0; volver.anchorX = 0
	volver.x = width * 0.85; volver.y = height * 0.1
		
		local scS = display.newText( scoresum, width * 0.15, height * 0.65, native.systemFontBold, 25 )
		local scR =  display.newText( scorerest, width* 0.375, height * 0.65, native.systemFontBold, 25 )
		local scM = display.newText( scoremult, width * 0.7, height * 0.65, native.systemFontBold, 25)
	sceneGroup:insert(scS)
	sceneGroup:insert(scR)
	sceneGroup:insert(scM)
	sceneGroup:insert(volver)
	volver:addEventListener("tap", regresar)

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