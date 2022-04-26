import Foundation
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */
class Sprites : RenderableEntity {

    let mainSprites : Image
    let black : Image
    var count = 0
    var maxCount = 8
    var swap = 0
    var xPos = 0
    var yPos = 0
    var downMove = false
    var upMove = false
    var leftMove = false
    var rightMove = false
    var restrict = false
    var swap2 = 0
    var current = "down"
    var slash = false
    var shield = false
    var upBound = false
    var downBound = false
    var leftBound = false
    var rightBound = false
    
    init() {
        guard let mainSpritesURL = URL(string:"https://linkpicture.com/q/Download35839.png") else {
            fatalError("Failed to create URL for whitehouse")
        } 
        // https://linkpicture.com/q/Download8580.png
        guard let blackURL = URL(string:"https://images.pexels.com/videos/3045163/free-video-3045163.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500.png") else {
            fatalError("Failed to create URL for black")
        }
        //https://linkpicture.com/q/RobbieDevSprites.png
        // 
        mainSprites = Image(sourceURL:mainSpritesURL)
        black = Image(sourceURL:blackURL)
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(mainSprites)
        canvas.setup(black)
        xPos = canvasSize.center.x
        yPos = canvasSize.center.y
    }

    override func render(canvas:Canvas) {
        if downMove == true {
            current = "down"
            swap += 1
            swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
                if downBound == true {
                } else {
                    yPos += 10
                }
            }
            if swap2 > 11 {
                downMove = false
                restrict = false
                swap2 = 0
                count = 0
            }
            if count > 8 {
                count = 0
            }
        }
        if upMove == true {
            current = "up"
            swap += 1
            swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
                if upBound == true {
                } else {
                    yPos -= 10
                }
            }
            if swap2 > 11 {
                upMove = false
                restrict = false
                swap2 = 0
                count = 0
            }
            if count > 8 {
                count = 0
            }
        }
        if leftMove == true {
            current = "left"
            swap += 1
            swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
                if leftBound == true {
                } else {
                    xPos -= 10
                }
            }
            if swap2 > 11 {
                leftMove = false
                restrict = false
                swap2 = 0
                count = 0
            }
            if count > 8 {
                count = 0
            }
        }
        if rightMove == true {
            current = "right"
            swap += 1
            swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
                if rightBound == true {
                } else {
                    xPos += 10
                }
            }
            if swap2 > 11 {
                rightMove = false
                restrict = false
                swap2 = 0
                count = 0
            }
            if count > 8 {
                count = 0
            }
        }

        if slash == true {
            if current == "right" {
                current = "rightSlash"
            }
            if current == "left" {
                current = "leftSlash"
            }
            if current == "up" {
                current = "upSlash"
            }
            if current == "down" {
                current = "downSlash"
            }
            if current == "rightShield" {
                current = "rightSlash"
            }
            if current == "leftShield" {
                current = "leftSlash"
            }
            if current == "upShield" {
                current = "upSlash"
            }
            if current == "downShield" {
                current = "downSlash"
            }

            swap += 1
            swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
            }
            if swap2 > 11 {
                slash = false
                restrict = false
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
            swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
            }
            if swap2 > 11 {
                shield = false
                restrict = false
                swap2 = 0
                count = 6
            }
            if count > 6 {
                count = 6
            }
        }

        
        if black.isReady {
            let blackRect = Rect(topLeft:Point(x:50, y:50), size: Size(width:50, height: 50))
            let blackdestination = Rect(topLeft:Point(x:0, y:0), size:Size(width: Int.max, height: Int.max))
            black.renderMode = .sourceAndDestination(sourceRect: blackRect, destinationRect: blackdestination)
            canvas.render(black)
            }
            
         

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
            
            let destinationRect = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:84, height:84))
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

    override func calculate(canvasSize: Size) {
        let canvasBoundingRect = Rect(size:canvasSize)
        let mainCharacter = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:84, height:84))
        let containment = canvasBoundingRect.containment(target: mainCharacter)

        // Bounce horizontally
        if !containment.intersection([.overlapsRight, .beyondRight]).isEmpty {
            rightBound = true
        } else {
            rightBound = false
        }
        if !containment.intersection([.overlapsLeft, .beyondLeft]).isEmpty {
            leftBound = true
        } else {
            leftBound = false
        }
        if !containment.intersection([.overlapsBottom, .beyondBottom]).isEmpty {
            downBound = true
        } else {
            downBound = false
        }
        if !containment.intersection([.overlapsTop, .beyondTop]).isEmpty {
            upBound = true
        } else {
            upBound = false
        }
    }
}
   
