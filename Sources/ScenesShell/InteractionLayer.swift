import Scenes
import Igis

/*
 This class is responsible for the interaction Layer.
 Internally, it maintains the RenderableEntities for this layer.
 */


class InteractionLayer : Layer, KeyDownHandler {
    let sprites = Sprites()

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
    }
}
 
