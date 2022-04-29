import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    let ground : Image
    let grass : Image
    var csx = 0
    var csy = 0
    var ys = 0
    var xs = 0
    var ytot = 0
    var xtot = 0
    var time = 0
    
    func gRow(canvas:Canvas, obj: Image, columns: Int, yt: Int) {
        for i in 0 ... columns {
            ytot = ys + yt * csy / 11 - csy / 11
            obj.renderMode = .destinationRect(Rect(topLeft:Point(x:xtot, y: ytot), size:Size(width:csx / 21 + 1, height:csy / 11 + 1)))
            xs = i * csx / 21
            
            canvas.render(obj)
        }
    }
    func gGrid(canvas:Canvas, obj: Image, columns: Int, yt: Int, xt: Int, rows: Int) {
        for i in 0 ... rows {
            xtot = xt * csx / 21 - csx / 21 + columns * csx / 21
            gRow(canvas:canvas, obj:obj, columns:columns, yt: yt)
            obj.renderMode = .destinationRect(Rect(topLeft:Point(x:xt * csx / 21 - csx / 21, y: ys), size:Size(width:csx / 21, height:csy / 11)))
            ys = i * csy / 11

            let testx1 = xs + xt * csx / 21
            let testy1 = ys + yt * csx / 21
            print(testx1, testy1)
        }
    }
    
    init() {
        guard let groundURL = URL(string:"https://www.linkpicture.com/q/download-2_48.png") else {
            fatalError("Failed to create URL for GROUND")
        }
        ground = Image(sourceURL:groundURL)

        guard let grassURL = URL(string:"https://www.linkpicture.com/q/Screenshot-2022-04-29-8.44.10-AM-2.png") else {
            fatalError("Failed to create URL for GRASS")
        }
        grass = Image(sourceURL:grassURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"bgLayer")
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(ground)
        canvas.setup(grass)
        csx = canvasSize.width
        csy = canvasSize.height
    }
    override func render(canvas:Canvas) {
        if ground.isReady {
            ground.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y: 0), size:Size(width:csx / 21, height:csy / 11)))

            gGrid(canvas:canvas, obj: ground, columns: 21, yt: 1, xt: 0, rows: 11)

            
        }
        if grass.isReady {
            grass.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width: csx / 21, height:csy / 11)))

            gGrid(canvas:canvas, obj: grass, columns: 21, yt: 1, xt: 0, rows: 0)
            gGrid(canvas:canvas, obj: grass, columns: 21, yt: 1, xt: 0, rows: 0)  
            gGrid(canvas:canvas, obj: grass, columns: 21, yt: 1, xt: 0, rows: 0)
            gGrid(canvas:canvas, obj: grass, columns: 21, yt: 11, xt: 0, rows: 0)
            gGrid(canvas:canvas, obj: grass, columns: 0, yt: 2, xt: 0, rows: 10)
            gGrid(canvas:canvas, obj:grass, columns: 1, yt: 2, xt: 20, rows: 10)
            time = 0
        }
    }
}
