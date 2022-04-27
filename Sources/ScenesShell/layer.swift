import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    let ground : Image

    init() {
        guard let groundURL = URL(string:"https://www.linkpicture.com/view.php?img=LPic62685e8e2ecf11292078133") else {
            fatalError("Failed to create URL for ground")
        }
        ground = Image(sourceURL:groundURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"bgLayer")
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(ground)
    }
    override func render(canvas:Canvas) {
        if ground.isReady {
            ground.renderMode = .destinationRect(Rect(topLeft:Point(x:100, y:200), size:Size(width:32, height:32)))
            canvas.render(ground)
        }
    }
}
