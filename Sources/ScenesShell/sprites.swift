import Foundation
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */
class Sprites : RenderableEntity {
    let mainSprites : Image
    let robbieSprites : Image
    let fireSprites: Image
    let skelSprites: Image




    var count = 0
    var count2 = 0
    var maxCount = 8
    var swap = 0
    var xPos = 0
    var yPos = 0
    var fxPos = 0
    var fyPos = 0
    var downMove = false
    var upMove = false
    var leftMove = false
    var rightMove = false
    var swap2 = 0
    var swap3 = 0
    var count3 = 0
    var count4 = 0
    var current = "down"
    var current2 = "down"
    var slash = false
    var shield = false
    var cast = false
    var upBound = false
    var downBound = false
    var leftBound = false
    var rightBound = false
    var currentSprite = "main"
    var fireball = false
    var fireSize = 10

    init() {
        guard let mainSpritesURL = URL(string:"https://www.linkpicture.com/q/download_381.png") else {
            fatalError("Failed to create URL for whitehouse")
        } 
        // 
        
        guard let robbieSpritesURL = URL(string:"https://linkpicture.com/q/Download35839.png") else {
            fatalError("DevSprites Locked...")
        }
        guard let fireSpritesURL = URL(string:"https://linkpicture.com/q/images-removebg-preview_13.png") else {
            fatalError("Fireball exploded...")
        }
        guard let skelSpritesURL = URL(string:"https://linkpicture.com/q/Download75802.png") else {
            fatalError("Skeleton collapsed...")
        }
        
        //https://linkpicture.com/q/RobbieDevSprites.png
        // 
        mainSprites = Image(sourceURL:mainSpritesURL)
        robbieSprites = Image(sourceURL:robbieSpritesURL)
        fireSprites = Image(sourceURL:fireSpritesURL)
        skelSprites = Image(sourceURL:skelSpritesURL)
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(mainSprites)
        canvas.setup(robbieSprites)
        canvas.setup(fireSprites)
        canvas.setup(skelSprites)
        xPos = canvasSize.center.x
        yPos = canvasSize.center.y
        fxPos = xPos
        fyPos = yPos
    }

    override func render(canvas:Canvas) {
        if downMove == true {
            current = "down"
            swap += 1
            if swap > 1 {
                swap = 0
                count += 1
                if downBound == true {
                } else {
                    yPos += 15
                }
            }
            if count > 8 {
                count = 0
            }
        }
        if upMove == true {
            current = "up"
            swap += 1
            //swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
                if upBound == true {
                } else {
                    yPos -= 15
                }
            }
            //if swap2 > 11 {
            //    upMove = false
            //    restrict = false
            //    swap2 = 0
            //    count = 0
            //}
            if count > 8 {
                count = 0
            }
        }
        if leftMove == true {
            current = "left"
            swap += 1
            //swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
                if leftBound == true {
                } else {
                    xPos -= 15
                }
            }
            //if swap2 > 11 {
            //    leftMove = false
            //    restrict = false
            //    swap2 = 0
            //    count = 0
            //}
            if count > 8 {
                count = 0
            }
        }
        if rightMove == true {
            current = "right"
            swap += 1
            //swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
                if rightBound == true {
                } else {
                    xPos += 15
                }
            }
            //if swap2 > 11 {
            //    rightMove = false
            //    restrict = false
            //    swap2 = 0
            //    count = 0
            //}
            if count > 8 {
                count = 0
            }
        }
    
        if slash == true {
            switch (current) {
            case "right":
                current = "rightSlash"
            case "left":
                current = "leftSlash"
            case "up": 
                current = "upSlash"
            case "down": 
                current = "downSlash"
            case "rightShield":
                current = "rightSlash"
            case "leftShield" :
                current = "leftSlash"
            case "upShield":
                current = "upSlash"
            case "downShield":
                current = "downSlash"
            default :
                break
            }

            swap += 1
            swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
            }
            if swap2 > 11 {
                slash = false
            //    restrict = false
                swap2 = 0
                count = 0
            }
            if count > 5 {
                count = 0
            }
        }
        if shield == true {
            if current == "right" {
                current = "rightShield"
            }
            if current == "left" {
                current = "leftShield"
            }
            if current == "up" {
                current = "upShield"
            }
            if current == "down" {
                current = "downShield"
            }
            if current == "rightSlash" {
                current = "rightShield"
            }
            if current == "leftSlash" {
                current = "leftShield"
            }
            if current == "upSlash" {
                current = "upShield"
            }
            if current == "downSlash" {
                current = "downShield"
            }

            swap += 1
            //swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
            }
            //if swap2 > 11 {
            //    shield = false
            //    restrict = false
            //    swap2 = 0
            //    count = 6
            //}
            if count > 6 {
                count = 6
            }
        }
        if cast == true && currentSprite == "robbie" {
            if current == "right" {
                current = "rightCast"
            }
            if current == "left" {
                current = "leftCast"
            }
            if current == "up" {
                current = "upCast"
            }
            if current == "down" {
                current = "downCast"
            }
            if current == "rightSlash" {
                current = "rightCast"
            }
            if current == "leftSlash" {
                current = "leftCast"
            }
            if current == "upSlash" {
                current = "upCast"
            }
            if current == "downSlash" {
                current = "downCast"
            }
            if current == "rightShield" {
                current = "rightCast"
            }
            if current == "leftShield" {
                current = "leftCast"
            }
            if current == "upShield" {
                current = "upCast"
            }
            if current == "downShield" {
                current = "downCast"
            }
            if current == "downCast" {
                current2 = "down"
            }
            if current == "upCast" {
                current2 = "up"
            }
            if current == "leftCast" {
                 current2 = "left"
            }
            if current == "rightCast" {
                current2 = "right"
            }
            
            swap += 1
            swap2 += 1
            if swap > 15 {
                swap = 0
                count += 1
            }
            if swap2 > 105 {
                cast = false
                //restrict = false
                swap2 = 0
                count = 0
            }
            if count > 6 {
                count = 0
            }
        }


        if fireball == true {
            swap3 += 1
            if swap3 > 2 {
                swap3 = 0
                count2 += 1
            }
            if current2 == "right" {

                if count3 > 30 {
                    fxPos += 7
                }
                fyPos -= 1
                fireSize += 2
                count3 += 1
            }
            if current2 == "left" {
                if count3 > 30 {
                    fxPos -= 7
                }
                    fireSize += 2
                    fyPos -= 1
                    count3 += 1
            }
            if current2 == "up" {
                fireSize += 2
                if count3 > 30 {
                    fyPos -= 7
                }            
                fxPos -= 1
                count3 += 1
            }
            if current2 == "down" {
                if count3 > 30 {
                    fyPos += 7
                }
                fireSize += 2
                fxPos -= 1
                count3 += 1
                
            }
            
            if count2 > 5 {
                count2 =  0
                count4 += 1
            }
            if count4 > 3 {
                count4 = 0
            }
        }
        
        if currentSprite == "main" {
            if mainSprites.isReady {
                let downRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 11) + (46 * 10)), size:Size(width:56, height:56))
                let upRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 9) + (46 * 8)), size:Size(width:56, height:56))
                let leftRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 10) + (46 * 9)), size:Size(width:56, height:56))
                let rightRect = Rect(topLeft:Point(x: (64 * count) + 8, y:(11 * 64) + 7), size:Size(width:56, height:56))
                let upSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72, y:(22 * 64) + 7), size:Size(width:129, height:56))
                let leftSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72 - 25, y:(25 * 64) + 7), size:Size(width:129, height:56))
                let downSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72, y:(28 * 64) + 7), size:Size(width:130, height:60))
                let rightSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72 - 25, y:(31 * 64) + 7), size:Size(width:130, height:56))
                let downShield = Rect(topLeft:Point(x:(64 * count) + 8, y: (6 * 64) + 7), size:Size(width:56, height:56))
                let upShield = Rect(topLeft:Point(x:(64 * count) + 8, y: (4 * 64) + 7), size:Size(width:56, height:56))
                let leftShield = Rect(topLeft:Point(x:(64 * count) + 8, y:(5 * 64) + 7), size:Size(width:56, height:56))
                let rightShield = Rect(topLeft:Point(x: (64 * count) + 8, y:(7 * 64) + 7), size:Size(width:56, height:56))
                
                let destinationRect = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:64, height:64))
                let slashRect = Rect(topLeft:Point(x:xPos - 25, y:yPos), size:Size(width:194, height:84))
                if current == "down" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:downRect, destinationRect:destinationRect)
                }
                if current == "up" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:upRect, destinationRect:destinationRect)
                }
                if current == "left" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:leftRect, destinationRect:destinationRect)
                }
                if current == "right" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:rightRect, destinationRect:destinationRect)
                }
                if current == "upSlash" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:upSlash, destinationRect:slashRect)
                }
                if current == "leftSlash" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:leftSlash, destinationRect:slashRect)
                }
                if current == "downSlash" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:downSlash, destinationRect:slashRect)
                }
                if current == "rightSlash" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:rightSlash, destinationRect:slashRect)
                }
                if current == "downShield" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:downShield, destinationRect:destinationRect)
                }
                if current == "upShield" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:upShield, destinationRect:destinationRect)
                }
                if current == "leftShield" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:leftShield, destinationRect:destinationRect)
                }
                if current == "rightShield" {
                    mainSprites.renderMode = .sourceAndDestination(sourceRect:rightShield, destinationRect:destinationRect)
                }
                
                canvas.render(mainSprites)
                
            }
        }
        
        if currentSprite == "robbie" {
            if robbieSprites.isReady {
                let downRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 11) + (46 * 10)), size:Size(width:56, height:56))
                let upRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 9) + (46 * 8)), size:Size(width:56, height:56))
                let leftRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 10) + (46 * 9)), size:Size(width:56, height:56))
                let rightRect = Rect(topLeft:Point(x: (64 * count) + 8, y:(11 * 64) + 7), size:Size(width:56, height:56))
                let upSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72, y:(22 * 64) + 7), size:Size(width:129, height:56))
                let leftSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72 - 25, y:(25 * 64) + 7), size:Size(width:129, height:56))
                let downSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72, y:(28 * 64) + 7), size:Size(width:130, height:60))
                let rightSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72 - 25, y:(31 * 64) + 7), size:Size(width:130, height:56))
                let downShield = Rect(topLeft:Point(x:(64 * count) + 8, y: (6 * 64) + 7), size:Size(width:56, height:56))
                let upShield = Rect(topLeft:Point(x:(64 * count) + 8, y: (4 * 64) + 7), size:Size(width:56, height:56))
                let leftShield = Rect(topLeft:Point(x:(64 * count) + 8, y:(5 * 64) + 7), size:Size(width:56, height:56))
                let rightShield = Rect(topLeft:Point(x: (64 * count) + 8, y:(7 * 64) + 7), size:Size(width:56, height:56))
                let downCast = Rect(topLeft:Point(x:(64 * count) + 8, y: (2 * 64) + 7), size:Size(width:56, height:56))
                let upCast = Rect(topLeft:Point(x:(64 * count) + 8, y: (0 * 64) + 7), size:Size(width:56, height:56))
                let leftCast = Rect(topLeft:Point(x:(64 * count) + 8, y:(1 * 64) + 7), size:Size(width:56, height:56))
                let rightCast = Rect(topLeft:Point(x: (64 * count) + 8, y:(3 * 64) + 7), size:Size(width:56, height:56))
                let fireCast = Rect(topLeft:Point(x: 45 * count2 + 10, y: 45 * count4 + 11), size:Size(width:35, height: 35))
                
                let destinationRect = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:64, height:64))
                let slashRect = Rect(topLeft:Point(x:xPos - 25, y:yPos), size:Size(width:194, height:84))
                let fireRect = Rect(topLeft:Point(x:fxPos, y:fyPos), size:Size(width:fireSize, height: fireSize))
                
                if current == "down" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:downRect, destinationRect:destinationRect)
                }
                if current == "up" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:upRect, destinationRect:destinationRect)
                }
                if current == "left" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:leftRect, destinationRect:destinationRect)
                }
                if current == "right" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:rightRect, destinationRect:destinationRect)
                }
                if current == "upSlash" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:upSlash, destinationRect:slashRect)
                }
                if current == "leftSlash" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:leftSlash, destinationRect:slashRect)
                }
                if current == "downSlash" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:downSlash, destinationRect:slashRect)
                }
                if current == "rightSlash" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:rightSlash, destinationRect:slashRect)
                }
                if current == "downShield" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:downShield, destinationRect:destinationRect)
                }
                if current == "upShield" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:upShield, destinationRect:destinationRect)
                }
                if current == "leftShield" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:leftShield, destinationRect:destinationRect)
                }
                if current == "rightShield" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:rightShield, destinationRect:destinationRect)
                }
                if current == "downCast" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:downCast, destinationRect:destinationRect)
                                        
                }
                if current == "upCast" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:upCast, destinationRect:destinationRect)
                }
                if current == "leftCast" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:leftCast, destinationRect:destinationRect)
                }
                if current == "rightCast" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:rightCast, destinationRect:destinationRect)
                }

                if fireball == true {
                    fireSprites.renderMode = .sourceAndDestination(sourceRect:fireCast, destinationRect:fireRect)
                }
                if fireball == true {
                    canvas.render(fireSprites)
                }
                canvas.render(robbieSprites)
                
                
            }
        }
    }
        
        
    

    override func calculate(canvasSize: Size) {
        let canvasBoundingRect = Rect(size:canvasSize)
        let mainCharacter = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:84, height:84))
        let containment = canvasBoundingRect.containment(target: mainCharacter)
        let firebla = Rect(topLeft:Point(x:fxPos, y:yPos), size:Size(width:fireSize, height:fireSize))
        let containment2 = canvasBoundingRect.containment(target: firebla)
        
        // Bounce horizontally
        if !containment.intersection([.overlapsRight, .beyondRight]).isEmpty {
            rightBound = true
        } else {
            rightBound = false
        }
        if !containment2.intersection([ .beyondRight]).isEmpty {
            fireball = false
            count3 = 0
        }
        
        if !containment.intersection([.overlapsLeft, .beyondLeft]).isEmpty {
            leftBound = true
        } else {
            leftBound = false
        }
        if !containment2.intersection([ .beyondLeft]).isEmpty {
            fireball = false
            count3 = 0
        }
        if !containment.intersection([.overlapsBottom, .beyondBottom]).isEmpty {
            downBound = true
        } else {
            downBound = false
        }
        if !containment2.intersection([ .beyondBottom]).isEmpty {
            fireball = false
            count3 = 0
        }
        if !containment.intersection([.overlapsTop, .beyondTop]).isEmpty {
            upBound = true
        } else {
            upBound = false
        }
        if !containment2.intersection([ .beyondTop]).isEmpty {
            fireball = false
            count3 = 0
        }
    }
}

