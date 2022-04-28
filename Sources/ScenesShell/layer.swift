import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    let ground : Image
    var csx = 0
    var csy = 0
    var ys = 0
    var xs = 0
    func row(canvas:Canvas, obj: Image, columns: Int) {
        for i in 0 ... columns {            
            obj.renderMode = .destinationRect(Rect(topLeft:Point(x:i * csx / 21, y:ys), size:Size(width:csx / 21 + 1, height:csy / 11 + 1)))
            canvas.render(obj)
            xs = i * csx / 21
        }
    }
    func grid(canvas:Canvas, obj: Image, columns: Int, rows: Int) {
        for i in 0 ... rows {
            row(canvas:canvas, obj:obj, columns:columns)
            obj.renderMode = .destinationRect(Rect(topLeft:Point(x:xs, y:i * csy / 11), size:Size(width:csx / 21, height:csy / 11)))
            ys = i * csy / 11
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
            ground.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width:csx / 21, height:csy / 1)))

            grid(canvas:canvas, obj: ground, columns: 21, rows: 11)
        }
    }
}
