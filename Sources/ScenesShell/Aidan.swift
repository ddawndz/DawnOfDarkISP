import Scenes
import Igis

class Aidan : RenderableEntity {

    //Define Functions here.
    
    func renderColorRect(canvas: Canvas, rect: Rect, R: Int, G: Int, B: Int) {
        let rectangle = Rectangle(rect:rect, fillMode:.fill)
        let fillStyle = FillStyle(color:Color(red:UInt8(R), green:UInt8(G), blue:UInt8(B)))
        canvas.render(fillStyle, rectangle)
    }
    
    func Hitbox(canvas: Canvas, rect: Rect)
    
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Aidan")
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        // setting the size and rendering

    }
}
