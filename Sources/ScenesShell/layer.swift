import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    
    let backgroundSpeed : Int
    let parallaxBackgrounds : [Image]
    var parallaxCurrentPoints : [Point]

    let dark : Image
    
    init(backgroundSpeed: Int) {
        guard let parallaxBackgroundURL = URL(string: "https://i.ibb.co/C09XGhG/1920x1080-1.png") else {
            fatalError("Failed to create URL for parallaxBackground")
        }
        guard let darkURL = URL(string: " ") else {
            fatalError("failed to create URL for dark")
        }
        dark = Image(sourceURL: darkURL)
        
        parallaxBackgrounds = [Image(sourceURL: parallaxBackgroundURL), Image(sourceURL: parallaxBackgroundURL)]
        parallaxCurrentPoints = [Point(), Point()]
        self.backgroundSpeed = backgroundSpeed

        super.init(name:"bgLayer")
    }
    override func setup(canvasSize: Size, canvas: Canvas) {
        canvas.setup(dark)
    }
    override func render(canvasSize: Size, canvas: Canvas) {
        if dark.isReady {
            canvas.render(dark)
        }
    }
}
