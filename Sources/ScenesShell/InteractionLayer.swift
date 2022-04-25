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
        if key == "s" {
            if sprites.restrict == true {
            } else {
                sprites.downMove = true
                sprites.restrict = true
            }
        }
        if key == "w" {
            if sprites.restrict == true {
            } else {
                sprites.upMove = true
                sprites.restrict = true
            }
        }
        if key == "a" {
            if sprites.restrict == true {
            } else {
                sprites.leftMove = true
                sprites.restrict == true
            }
        }
        if key == "d" {
            if sprites.restrict == true {
            } else {
                sprites.rightMove = true
                sprites.restrict = true
            }
        }
    }
}
 
