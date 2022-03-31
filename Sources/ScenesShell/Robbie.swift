import Scenes
import Igis

class Robbie : RenderableEntity {

    func renderRectangle(canvas: Canvas, rect: Rect, color: FillStyle, border: StrokeStyle) {
        let currentRect = rect

        let linewidth = Linewidth(linewith: 1)

        canvas.render(currentRect, Linewidth, color, border)
    }

        


    init() {
        super.init(name:"Robbie")
    }

    
    
}
