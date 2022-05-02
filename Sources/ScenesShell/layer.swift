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
    var xt = 0
    var didRender = false
    var screen = 1
    
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
        print(csx / 21)
        gGrid(canvas:canvas, obj: ground, columns: 21, xt: 0, yt: 0, rows: 11)


        grass.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width: csx / 21, height:csy / 11)))
        print(csx / 21)

        gGrid(canvas:canvas, obj: grass, columns: 21, xt: 0, yt: 0, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 0, yt: 0, rows: 10)
        gGrid(canvas:canvas, obj: grass, columns: 9, xt: 0, yt: 10, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 8, xt: 12, yt: 10, rows: 0)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 20, yt: 0, rows: 2)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 20, yt: 5, rows: 1)
        gGrid(canvas:canvas, obj: grass, columns: 0, xt: 20, yt: 9, rows: 1)
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
        if ground.isReady && grass.isReady {
            if let canvasSize = canvas.canvasSize, !didRender {
                    // Clear the entire canvas
                let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
                let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
                canvas.render(clearRectangle)
    
                switch (screen) {
                case 1:
                    rS1(canvas:canvas)
                case 2:
                    rS2(canvas:canvas)
                case 3:
                    rS3(canvas:canvas)
                case 4:
                    rS4(canvas:canvas)
                case 5:
                    rS5(canvas:canvas)
                case 6:
                    rS6(canvas:canvas)
                case 7:
                    rS7(canvas:canvas)
                case 8:
                    rS8(canvas:canvas)
                case 9:
                    rS9(canvas:canvas)
                default:
                    fatalError("Unexpected pattern: \(screen)")
                }
                didRender = true
            }
        }
        /*if ground.isReady {
            ground.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y: 0), size:Size(width:csx / 21, height:csy / 11)))

            gGrid(canvas:canvas, obj: ground, columns: 21, xt: 0, yt: 0, rows: 11)

            
        }
        if grass.isReady {
            grass.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width: csx / 21, height:csy / 11)))

            gGrid(canvas:canvas, obj: grass, columns: 21, xt: 0, yt: 0, rows: 0)
            gGrid(canvas:canvas, obj: grass, columns: 0, xt: 0, yt: 0, rows: 10)
            gGrid(canvas:canvas, obj: grass, columns: 21, xt: 0, yt: 10, rows: 0)
            gGrid(canvas:canvas, obj: grass, columns: 0, xt: 20, yt: 0, rows: 10)
        }*/
    }
}
