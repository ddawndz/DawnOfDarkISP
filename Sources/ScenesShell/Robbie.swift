import Scenes
import Igis

class Robbie : RenderableEntity {
    
    func renderRectangle(canvas: Canvas, rect: Rect, color: FillStyle, border: StrokeStyle) {
        let rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        let linewidth = LineWidth(width:1)
        canvas.render(color, linewidth, border, rectangle)
    }     
    
    let black = FillStyle(color:Color(.black))
    let g = StrokeStyle(color:Color(.gray))
    
    init() {
        super.init(name:"Robbie")
    }
    
    override func setup(canvasSize:Size, canvas:Canvas) {
        let rect = Rect(topLeft: Point(x:500, y:500), size:Size(width: 50, height: 50))
        renderRectangle(canvas: canvas, rect: rect, color: black, border: g)
    }
    
}
