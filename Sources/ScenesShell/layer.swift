import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    //VARIABLES:
    var centerx = 0
    var centery = 0
    
    //FUNCTIONS:
    
    func colorRect(canvas: Canvas, rect: Rect, R: Int, G: Int, B: Int) {
        let rectangle = Rectangle(rect:rect, fillMode:.fill)
        let fillStyle = FillStyle(color:Color(red:UInt8(R), green:UInt8(G), blue:UInt8(B)))
        canvas.render(fillStyle, rectangle)
    }

    func colorRow(canvas: Canvas, rect: Rect, R: Int, G: Int, B: Int, columns: Int) {
        var currentRect = rect
        let numbers = [R, G, B]
        let max = numbers.max()
        if max == R{
            for _ in 0 ..< columns{
                let R = Int.random(in: 100..<255)
                let G = Int.random(in: 1 ..< 90)
                let B = Int.random(in: 1 ..< 90)
                colorRect(canvas: canvas, rect: currentRect, R:R,G:G,B:B)
                currentRect.topLeft.x += currentRect.size.width
            }
        } else if max == G{
            for _ in 0 ..< columns{
                let G = Int.random(in: 100..<255)
                let R = Int.random(in: 1 ..< 90)
                let B = Int.random(in: 1 ..< 90)
                colorRect(canvas: canvas, rect: currentRect, R:R,G:G,B:B)
                currentRect.topLeft.x += currentRect.size.width
            }
        } else if max == B{
            for _ in 0 ..< columns{
                let B = Int.random(in: 100..<255)
                let G = Int.random(in: 1 ..< 90)
                let R = Int.random(in: 1 ..< 90)
                colorRect(canvas: canvas, rect: currentRect, R:R,G:G,B:B)
                currentRect.topLeft.x += currentRect.size.width
            }
        }
    }

    func colorGrid(canvas:Canvas, rect:Rect, R:Int, G:Int, B:Int, columns:Int, rows: Int) {
        var currentRect = rect
        for _ in 0 ..< rows {
            colorRow(canvas: canvas, rect: currentRect, R:R, G:G,B:B, columns:columns)
            currentRect.topLeft.y += currentRect.size.height
        }
    }
    
    init() {
        super.init(name:"layer")
    }
    //OVERRIDES:
    
    override func setup(canvasSize:Size, canvas:Canvas) {
        //SETUP
        centerx = canvasSize.center.x
        centery = canvasSize.center.y
    }

    override func render(canvas:Canvas) {
        let skyRect = Rect(topLeft: Point(x: -10, y: -10), size: Size(width:10, height:10))

        colorGrid(canvas:canvas, rect: skyRect, R:10, G:10, B:100, columns:100, rows: 100)
    }
}
