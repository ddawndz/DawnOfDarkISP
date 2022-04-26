import Scenes
import Igis

/*
 This class is responsible for the interaction Layer.
 Internally, it maintains the RenderableEntities for this layer.
 */


class InteractionLayer : Layer, KeyDownHandler {
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
    }

    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        print(key)
        if key == "ArrowDown" {
            if sprites.restrict == true {
            } else {
                sprites.restrict = true
                sprites.downMove = true
            }
        }
        if key == "ArrowUp" {
            if sprites.restrict == true {
            } else {
                sprites.restrict = true
                sprites.upMove = true
            }
        }
        if key == "ArrowLeft" {
            if sprites.restrict == true {
            } else {
                sprites.restrict == true
                sprites.leftMove = true
            }
        }
        if key == "ArrowRight" {
            if sprites.restrict == true {
            } else {
                sprites.restrict = true
                sprites.rightMove = true
            }
        }
        if key == "z" {
            if sprites.restrict == true {
            } else {
                sprites.restrict = true
                sprites.slash = true
            }
        }
        if key == "x" {
            if sprites.restrict == true {
            } else {
                sprites.restrict = true
                sprites.shield = true
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
}
 
