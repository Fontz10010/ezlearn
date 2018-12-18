--
local composer = require("composer")
local scene  = composer.newScene()
local width = display.contentWidth
local height = display.contentHeight
local fondo, boton
function Reiniciar(  )
	--composer.gotoScene("view3")
    composer.hideOverlay("fade", 400)
end

function scene:create( event )
 
    local sceneGroup = self.view
    fondo = display.newImageRect("Imagenes/Fondos/Pausa.PNG",width,height)
    fondo.anchorX = 0; fondo.anchorY = 0

    boton = display.newRect(width*0.215, height * 0.745, width* 0.586, width * 0.128)
    boton.anchorY= 0; boton.anchorX = 0
    boton.alpha = 0.1
    sceneGroup:insert(fondo)
    sceneGroup:insert(boton)
    --[[local myText = display.newText("Has perdido, Jolines!", 0, 0, native.systemFont, 32)
    myText.anchorX =0; myText.anchorY = 0;
    sceneGroup:insert(myText)
    local botonR = display.newText("Reiniciar", display.contentHeight/2, display.contentWidth/2, native.systemFont, 32)
    botonR.anchorY = 0; botonR.anchorX = 0
   	sceneGroup:insert(botonR)
   	composer.removeScene( "sumas" )
   	botonR:addEventListener("tap",Reiniciar)]]
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 


-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 		
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 		local sceneGroup = self.view
    
   	    composer.removeScene( "sumas" )
   	    boton:addEventListener("tap",Reiniciar)
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
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
