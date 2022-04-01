import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    
    let backgroundSpeed : Int
    let parallaxBackgrounds : [Image]
    var parallaxCurrentPoints : [Point]

    init(backgroundSpeed: Int) {
        guard let parallaxBackgroundURL = URL(string: "https://i.ibb.co/C09XGhG/1920x1080-1.png") else {
            fatalError("Failed to create URL for parallaxBackground")
        }
        parallaxBackgrounds = [Image(sourceURL: parallaxBackgroundURL), Image(sourceURL: parallaxBackgroundURL)]
        parallaxCurrentPoints = [Point(), Point()]
        self.backgroundSpeed = backgroundSpeed

        super.init(name:"bgLayer")
    }    
}
