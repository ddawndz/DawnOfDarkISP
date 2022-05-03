import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity {
    let ground : Image
    let grass : Image
    let rock : Image
    let entrance : Image
    var csx = 0
    var csy = 0
    var ys = 0
    var xs = 0
    var ytot = 0
    var xtot = 0
    var time = 0
    var xt = 0
    var screen = 1
    var inf = true
    let sprites = Sprites()
    
    func gRow(canvas:Canvas, obj: Image, columns: Int, xt: Int) {
        for i in 0 ... columns {
            obj.renderMode = .destinationRect(Rect(topLeft:Point(x:csx / 21 * i + xt * csx / 21,y: ytot), size:Size(width:csx / 21 + 1, height:csy / 11 + 1)))
            
            xtot = csx / 21 * i + xt * csx / 21
            canvas.render(obj)
        }
    }

    func gGrid(canvas:Canvas, obj: Image, columns: Int, xt: Int, yt: Int, rows: Int) {
        for i in 0 ... rows {
            obj.renderMode = .destinationRect(Rect(topLeft:Point(x:xtot ,y: csy / 11 * i + yt * csy / 11 - 1), size:Size(width:csx / 21 + 1, height:csy / 11 + 1)))
            
            ytot = csy / 11 * i + yt * csy / 11 - 1
            
            gRow(canvas:canvas, obj:obj, columns:columns, xt:xt)
        }
    }

    func rS1(canvas: Canvas) {
        ground.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y: 0), size:Size(width:csx / 21, height:csy / 11)))

        gGrid(canvas:canvas, obj: ground, columns: 21, xt: 0, yt: 0, rows: 11)

        grass.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width: csx / 21, height:csy / 11)))

        gGrid(canvas:canvas, obj: grass, columns: 21, xt: 0, yt: 0, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 0, yt: 0, rows: 10)
        gGrid(canvas:canvas, obj: grass, columns: 9, xt: 0, yt: 10, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 8, xt: 12, yt: 10, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 20, yt: 0, rows: 2)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 20, yt: 5, rows: 1)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 20, yt: 9, rows: 1)
        gGrid(canvas:canvas, obj: grass, columns: 2, xt: 3, yt: 5, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 2, xt: 3, yt: 7, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 2, xt: 13, yt: 5, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 2, xt: 13, yt: 7, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 2, xt: 8, yt: 8, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 2, xt: 13, yt: 3, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 2, xt: 8, yt: 2, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 2, xt: 8, yt: 4, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 8, yt: 5, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 10, yt: 5, rows: 0) 

        entrance.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width: csx / 21, height: csy / 11)))

        gGrid(canvas:canvas, obj: entrance, columns: 2, xt: 3, yt: 3, rows: 0)

        rock.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width: csx / 21, height: csy / 11)))

        gGrid(canvas:canvas, obj: rock, columns: 1, xt: 3, yt: 1, rows: 0)
        gGrid(canvas:canvas, obj: rock, columns: 3, xt: 2, yt: 2, rows: 0)
        gGrid(canvas:canvas, obj: rock, columns: 2, xt: 1, yt: 3, rows: 0)
        gGrid(canvas:canvas, obj: rock, columns: 0, xt: 5, yt: 3, rows: 0)
    }

    func rS2(canvas: Canvas) {
        
    }

    func rS3(canvas: Canvas) {
    }

    func rS4(canvas: Canvas) {
    }

    func rS5(canvas: Canvas) {
    }

    func rS6(canvas: Canvas) {
    }
    
    func rS7(canvas: Canvas) {
    }

    func rS8(canvas: Canvas) {
    }

    func rS9(canvas: Canvas) {
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
        guard let rockURL = URL(string:"https://www.linkpicture.com/q/download_125.jpeg") else{
            fatalError("Failed to create URL for ROCK")
        }
        rock = Image(sourceURL:rockURL)
        guard let entranceURL = URL(string:"https://www.linkpicture.com/q/download-4_26.png") else{
                fatalError("Failed to create URL for ENTRANCE")
        }
        entrance = Image(sourceURL:entranceURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"bgLayer")
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(ground)
        canvas.setup(grass)
        canvas.setup(rock)
        canvas.setup(entrance)
        csx = canvasSize.width
        csy = canvasSize.height
    }
    override func calculate(canvasSize: Size) {
        let canvasBoundingRect = Rect(size:canvasSize) 
        let mainCharacter = Rect(topLeft:Point(x:sprites.xPos, y:sprites.yPos), size:Size(width:84, height:84))
        let containment = canvasBoundingRect.containment(target: mainCharacter)
        if containment.intersection([.overlapsTop, .beyondTop]).isEmpty {
            screen -= 3
        }
        if containment.intersection([.overlapsBottom, .beyondBottom]).isEmpty {
            screen += 3
        }
        if containment.intersection([.overlapsLeft, .beyondLeft]).isEmpty {
            screen -= 1
        }
        if containment.intersection([.overlapsRight, .beyondRight]).isEmpty {
            screen += 1
        }
        print(screen)
    }
    override func render(canvas:Canvas) {
        if ground.isReady && grass.isReady && rock.isReady{
            if screen == 1 {
                rS1(canvas:canvas)
            }
            if screen == 2 {
                rS2(canvas:canvas)
            }
            if screen == 3 {
                rS3(canvas:canvas)
            }
            if screen == 4 {
                rS4(canvas:canvas)
            }
            if screen == 5 {
                rS5(canvas:canvas)
            }
            if screen == 6 {
                rS6(canvas:canvas)
            }
            if screen == 7 {
                rS7(canvas:canvas)
            }
            if screen == 8 {
                rS8(canvas:canvas)
            }
            if screen == 9 {
                rS9(canvas:canvas)
            }
        }
    }
}
