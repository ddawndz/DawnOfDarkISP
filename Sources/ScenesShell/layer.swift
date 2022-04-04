import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {    
    let dark : Image
    
    init(backgroundSpeed: Int) {
        guard let darkURL = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRzpsTfOT_ZYZV_bR8DlQhBZet3Fwe7N9ydA&usqp=CAU.png") else {
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
            dark.renderMode = .destinationRect(Rect(topLeft:Point(x:-1, y:-1), size:Size(width:2, height:1)))
            canvas.render(dark)
        }
    }
}

