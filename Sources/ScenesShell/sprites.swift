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

    init() {
        guard let mainSpritesURL = URL(string:"https://linkpicture.com/q/RobbieDevSprites.png") else {
            fatalError("Failed to create URL for whitehouse")
        }
        // https://linkpicture.com/q/Download8580.png
        guard let blackURL = URL(string:"https://images.pexels.com/videos/3045163/free-video-3045163.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500.png") else {
            fatalError("Failed to create URL for black")
        }
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
                yPos += 10
            }
            if swap2 > 11 {
                downMove = false
                restrict = false
                swap2 = 0
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
                yPos -= 10
            }
            if swap2 > 11 {
                upMove = false
                restrict = false
                swap2 = 0
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
                xPos -= 10
            }
            if swap2 > 11 {
                leftMove = false
                restrict = false
                swap2 = 0
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
                xPos += 10
            }
            if swap2 > 11 {
                rightMove = false
                restrict = false
                swap2 = 0
            }
            if count > 5 {
                count = 0
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
            // let rightRect = Rect(topLeft:Point(x:(20 * ((count * 2) + 1)) + ((24 * count) - 15), y:(17 * 12) + (46 * 11)), size:Size(width:50, height:55))
            let rightRect = Rect(topLeft:Point(x: (64 * count) + 8, y:(11 * 64) + 7), size:Size(width:56, height:56))



            let destinationRect = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:84, height:84))

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



            canvas.render(mainSprites)
            
        }
    }

    override func calculate(canvasSize: Size) {
        let canvasBoundingRect = Rect(size:canvasSize)
        let mainCharacter = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:40, height:55))
        let containment = canvasBoundingRect.containment(target: mainCharacter)

        // Bounce horizontally
        if !containment.intersection([.overlapsRight, .beyondRight]).isEmpty {
            xPos -= 5
        }
        if !containment.intersection([.overlapsLeft, .beyondLeft]).isEmpty {
            xPos += 5
        }
        if !containment.intersection([.overlapsBottom, .beyondBottom]).isEmpty {
            yPos -= 5
        }
        if !containment.intersection([.overlapsTop, .beyondTop]).isEmpty {
            yPos += 5
        }
    }
}
   
