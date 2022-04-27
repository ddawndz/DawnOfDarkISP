import Scenes
import Igis

/*
 This class is responsible for the interaction Layer.
 Internally, it maintains the RenderableEntities for this layer.
 */


class InteractionLayer : Layer, KeyDownHandler, KeyUpHandler { 
    let sprites = Sprites()
    var devCount = 0
    
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")

        // We insert our RenderableEntities in the constructor
        insert(entity: sprites, at: .front)
    }

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerKeyDownHandler(handler: self)
        dispatcher.registerKeyUpHandler(handler: self)
    }

    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
        dispatcher.unregisterKeyUpHandler(handler: self)
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        print(key)
        if key == "ArrowDown" && sprites.slash == false && sprites.cast == false {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
                sprites.downMove = true
            //}
        }
        if key == "ArrowUp" && sprites.slash == false && sprites.cast == false {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
                sprites.upMove = true
            //}
        }
        if key == "ArrowLeft" && sprites.slash == false && sprites.cast == false {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict == true
                sprites.leftMove = true
            //}
        }
        if key == "ArrowRight" && sprites.slash == false && sprites.cast == false {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
                sprites.rightMove = true
            //}
        }
        if key == "z" && sprites.cast == false{
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
                sprites.slash = true
            //}
        }
        if key == "x" && sprites.cast == false && sprites.slash == false {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
                sprites.shield = true
            //}
        }
        if key == "c" && sprites.slash == false {
            //if sprites.restrict == true {
            if sprites.currentSprite == "robbie" {
                //sprites.restrict = true
                sprites.cast = true
                sprites.fireball = true
                sprites.fxPos = sprites.xPos
                sprites.fyPos = sprites.yPos
                sprites.fireSize = 10
            }
        }
        if key == "p" && devCount == 0 {
            devCount += 1
        }
        if key == "l" && (devCount == 1 || devCount == 5) {
            devCount += 1
        }
        if key == "u" && (devCount == 2 || devCount == 4) {
            devCount += 1
        }
        if key == "s" && devCount == 3 {
            devCount += 1
        }
        if key == "t" && devCount == 6 {
            devCount += 1
        }
        if key == "r" && devCount == 7 {
            devCount += 1
        }
        if key == "a" && devCount == 8 {
            sprites.currentSprite = "robbie"
        }
    }
    func onKeyUp(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
            if key == "ArrowUp" {
                sprites.upMove = false
            }
            if key == "ArrowLeft" {
                sprites.leftMove = false
            }
            if key == "ArrowRight" {
                sprites.rightMove = false
            }
            if key == "ArrowDown" {
                sprites.downMove = false
            }
            
            if key == "x" {
                sprites.shield = false
            }
    }
}

 
