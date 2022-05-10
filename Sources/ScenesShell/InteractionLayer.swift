import Scenes
import Igis

/*
 This class is responsible for the interaction Layer.
 Internally, it maintains the RenderableEntities for this layer.
 */


class InteractionLayer : Layer, KeyDownHandler, KeyUpHandler, EntityMouseClickHandler {
    let sprites = Sprites()
    let bglayer = bgLayer()
    var devCount = 0
    var mbbr = Rect(topLeft:(size:Size(width: 1, height: 1)))
    var gamestart = false

    func onEntityMouseClick(globalLocation:Point) {
        mbbr.topLeft.x = globalLocation.x
        mbbr.topLeft.y = globalLocation.y
    }

    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")

        // We insert our RenderableEntities in the constructor
        insert(entity: sprites, at: .front)
    }

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerKeyDownHandler(handler: self)
        dispatcher.registerKeyUpHandler(handler: self)
        dispatcher.registerEntityMouseHandler(handler: self)
    }

    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
        dispatcher.unregisterKeyUpHandler(handler: self)
        dispatcher.unregisterMouseClickHandler(handler: self)
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        print(key)
        if key == "s" && sprites.slash == false && sprites.cast == false && sprites.shield == false && sprites.lives >= 0 {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
            sprites.downMove = true
            sprites.leftMove = false
            sprites.rightMove = false
            sprites.upMove = false
            //}
        }
        if key == "w" && sprites.slash == false && sprites.cast == false && sprites.shield == false && sprites.lives >= 0 {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
            sprites.upMove = true
            sprites.downMove = false
            sprites.leftMove = false
            sprites.downMove = false
            //}
        }
        if key == "d" && sprites.slash == false && sprites.cast == false && sprites.shield == false && sprites.lives >= 0 {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict == true
            sprites.rightMove = true
            sprites.leftMove = false
            sprites.downMove = false
            sprites.upMove = false

        }
        if key == "a" && sprites.slash == false && sprites.cast == false && sprites.shield == false && sprites.lives >= 0 {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
            sprites.leftMove = true
            sprites.rightMove = false
            sprites.downMove = false
            sprites.upMove = false
        }
        if key == "n" && sprites.cast == false && sprites.shield == false && sprites.lives >= 0 {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
            sprites.slash = true
            //}
        }
        if key == "m" && sprites.cast == false && sprites.slash == false && sprites.lives >= 0 {
            //if sprites.restrict == true {
            //} else {
            //    sprites.restrict = true
            sprites.shield = true
            //}
        }
        if key == "," && sprites.slash == false && sprites.shield == false && sprites.lives >= 0 {
            if sprites.currentSprite == "robbie" {
                sprites.fireball = false
                sprites.cast = true
                sprites.fireball = true
                sprites.fireSize = 10
                sprites.count3 = 0
                sprites.fxPos = sprites.xPos
                sprites.fyPos = sprites.yPos
                switch sprites.current {
                case "up":
                    sprites.fyPos -= 5
                    sprites.fxPos += 32
                case "left":
                    sprites.fxPos -= 5
                    sprites.fyPos += 42
                case "right":
                    sprites.fxPos += 69
                    sprites.fyPos += 42
                case "down":
                    sprites.fxPos += 32
                    sprites.fyPos += 69
                case "upCast":
                    sprites.fyPos -= 5
                    sprites.fxPos += 32
                case "leftCast":
                    sprites.fxPos -= 5
                    sprites.fyPos += 42
                case "rightCast":
                    sprites.fxPos += 69
                    sprites.fyPos += 42
                case "downCast":
                    sprites.fxPos += 32
                    sprites.fyPos += 69
                default:
                    sprites.fxPos += 69
                    sprites.fyPos += 5
                }
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

        if key == "w" {
            sprites.upMove = false
        }
        if key == "a" {
            sprites.leftMove = false
        }
        if key == "d" {
            sprites.rightMove = false
        }
        if key == "s" {
            sprites.downMove = false
        }
        if key == "m" {
            sprites.shield = false
        }
        /*if key == "ArrowUp" {
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
         */

            if key == "w" {
                sprites.upMove = false
            }
            if key == "a" {
                sprites.leftMove = false
           }
            if key == "d" {
                sprites.rightMove = false
            }
            if key == "s" {
                sprites.downMove = false
            }
            
            if key == "m" {
                sprites.shield = false
            }
    }

    override func preCalculate(canvas: Canvas) {
        let gmb1br = Rect(topLeft:Point(x: csx / 2 - csx / 6 / 2, y: csy / 2 - csy / 13 / 2 + 60), size:Size(width:csx / 6, height: csy / 14))

        let containment = mbbr.containment(target: gmb1br)

        if !containment.intersection([.overlapsFully]).isEmpty {
            gamestart = true
        }

        if gamestart == true {
            sprites.gamestart = true
            bglayer.gamestart = true
        } else {
            sprites.gamestart = false
            bglayer.gamestart = true
        }
        print(sprites.gamestart, bglayer.gamestart)
    }
        
}
