import Foundation
import Scenes
import Igis

class Robbie : RenderableEntity {
    
    func renderRectangle(canvas: Canvas, rect: Rect, color: FillStyle, border: StrokeStyle) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let linewidth = LineWidth(width:1)
        canvas.render(color, linewidth, border, rectangle)
    }     

    let b = StrokeStyle(color:Color(.black)) 
    
    func renderPrismaticRectangle(canvas: Canvas, rect: Rect) {
        let rectangle = Rectangle(rect: rect, fillMode:.fill)
        let linewidth = LineWidth(width:1)
        let choice = Int.random(in: 0..<256)
        let choice2 = Int.random(in: 0..<256)
        let choice3 = Int.random(in: 0..<256)
        let coler = FillStyle(color:Color(red: UInt8(choice), green: UInt8(choice2), blue: UInt8(choice3)))

        
        canvas.render(coler, linewidth, rectangle)
        
        
    }
    
    func renderRectangleRow(canvas: Canvas, rect: Rect, columns: Int, color: FillStyle, border: StrokeStyle) {
        var currentRect = rect

        for _ in 0..<columns {
            renderRectangle(canvas: canvas, rect: currentRect, color: color, border: border)
            currentRect.topLeft.x += currentRect.size.width + 2
        }
    }

    func renderPrismaticRow(canvas: Canvas, rect: Rect, columns: Int) {
        var currentRect = rect

        for _ in 0..<columns {
            renderPrismaticRectangle(canvas: canvas, rect: currentRect)
            currentRect.topLeft.x += currentRect.size.width 
        }
    }
    
    func renderRectangleGrid(canvas: Canvas, rect: Rect, columns: Int, rows: Int, color: FillStyle, border: StrokeStyle) {
        var currentRect = rect

        for _ in 0..<rows {
            renderRectangleRow(canvas: canvas, rect: currentRect, columns: columns, color: color, border: border)
            currentRect.topLeft.y += currentRect.size.height + 2
        }
    }

    func renderPrismaticGrid(canvas: Canvas, rect: Rect, columns: Int, rows: Int) {
        var currentRect = rect
        
        for _ in 0..<rows {
            renderPrismaticRow(canvas: canvas, rect: currentRect, columns: columns)
            currentRect.topLeft.y += currentRect.size.height 
        }
            
    }
    
    func renderRectangleWall(canvas: Canvas, rect: Rect, columns: Int, rows: Int, color: FillStyle, border: StrokeStyle) {
        var currentRect = rect

        var swap = true

        for _ in 0..<rows {
            renderRectangleRow(canvas: canvas, rect: currentRect, columns: columns, color: color, border: border)
            currentRect.topLeft.y += currentRect.size.height + 2

            if swap == true {
                swap = false
                currentRect.topLeft.x += currentRect.size.width / 2 + 2
            } else {
                swap = true
                currentRect.topLeft.x -= currentRect.size.width / 2 + 2
            }
        }
    }



     
    let black = FillStyle(color:Color(.black))
    let g = StrokeStyle(color:Color(.gray))
    
    init() {
        super.init(name:"Robbie")
    }
        
    override func setup(canvasSize:Size, canvas:Canvas) {
        let rain = Rect(topLeft: Point(x:550, y:300), size:Size(width: 2, height: 2))
        renderPrismaticGrid(canvas:canvas, rect: rain, columns: 100, rows: 100)
    }

}
