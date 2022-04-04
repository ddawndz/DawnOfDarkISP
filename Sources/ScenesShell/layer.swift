import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    
    let dark : Image
    
    init(backgroundSpeed: Int) {
        guard let darkURL = URL(string: " ") else {
            fatalError("You failed. Now you know.")
        }
        dark = Image(sourceURL: darkURL)
        
        super.init(name:"bgLayer")
    }
    override func setup(canvasSize: Size, canvas: Canvas) {
        canvas.setup(dark)
    }
    override func render(canvas: Canvas) {
        if dark.isReady {
            canvas.render(dark)
        }
    }
    
}
