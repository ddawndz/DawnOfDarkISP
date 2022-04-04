import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    
    let dark : Image
    
    init(backgroundSpeed: Int) {
        guard let darkURL = URL(string: "https://www.linkpicture.com/q/output-onlinepngtools-1_11.png") else {
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
            dark.renderMode = .destinationRect(Rect(topLeft:Point(x:-1, y:-1), size:Size(width:2000, height:1000)))
            canvas.render(dark)
        }
    }
    
}
