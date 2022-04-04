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
        let choice = Int.random(in: 1..<15)
        var coler = FillStyle(color:Color(.red))
        if choice == 1 {
            coler = FillStyle(color:Color(.red))
        }
        if choice == 2 {
            coler = FillStyle(color:Color(.orange))
        }
        if choice == 3 {
            coler = FillStyle(color:Color(.yellow))
        }
        if choice == 4 {
            coler = FillStyle(color:Color(.green))
        }
        if choice == 5 {
            coler = FillStyle(color:Color(.blue))
        }
        if choice == 6 {
            coler = FillStyle(color:Color(.purple))
        }
        if choice == 7 {
            coler = FillStyle(color:Color(.black))
        }
        if choice == 8 {
            coler = FillStyle(color:Color(.white))
        }
        if choice == 9 {
            coler = FillStyle(color:Color(.gray))
        }
        if choice == 10 {
            coler = FillStyle(color:Color(.lime))
        }
        if choice == 11 {
            coler = FillStyle(color:Color(.magenta))
        }
        if choice == 12 {
            coler = FillStyle(color:Color(.crimson))
        }
        if choice == 13 {
            coler = FillStyle(color:Color(.azure))
        }
        if choice == 14 {
            coler = FillStyle(color:Color(.teal))
        }
        
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
        let rain = Rect(topLeft: Point(x:100, y:100), size:Size(width: 1, height: 1))
        renderPrismaticGrid(canvas:canvas, rect: rain, columns: 100, rows: 100)
    }
    
}
