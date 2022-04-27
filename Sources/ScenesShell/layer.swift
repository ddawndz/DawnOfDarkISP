import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    let ground : Image
    var csx = 0
    var csy = 0

    func row(canvas:Canvas, rect: Rect, obj: String, columns: Int) {
        var currentRect = rect
        for _ in 0 ... 22 {
            canvas.render(obj)
            currentRect.topLeft.x += currentRect.size.width
        }
    }
    
    init() {
        guard let groundURL = URL(string:"https://www.linkpicture.com/q/download-2_48.png") else {
            fatalError("Failed to create URL for ground")
        }
        ground = Image(sourceURL:groundURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"bgLayer")
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(ground)
        csx = canvasSize.width
        csy = canvasSize.height
    }
    override func render(canvas:Canvas) {
        if ground.isReady {
            ground.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width:32, height:32)))

            row(canvas:Canvas, rect: ground.destinationRect.Rect, obj: ground, columns: 20)
        }
    }
}
