import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    //VARIABLES:
    var centerx = 0
    var centery = 0
    
    //FUNCTIONS:
    
    func renderColorRect(canvas: Canvas, rect: Rect, R: Int, G: Int, B: Int) {
        let rectangle = Rectangle(rect:rect, fillMode:.fill)
        let fillStyle = FillStyle(color:Color(red:UInt8(R), green:UInt8(G), blue:UInt8(B)))
        canvas.render(fillStyle, rectangle)
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
    
    }
}
