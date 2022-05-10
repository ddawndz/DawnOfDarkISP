import Foundation
import Scenes
import Igis

class bgLayer : RenderableEntity, EntityMouseClickHandler {
    let ground : Image
    let grass : Image
    let rock : Image
    let entrance : Image
    let gm : Image
    let gm2 : Image
    let gmb1 : Image
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
    var radians = 0.0
    var gamestart = false
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
    
    func onEntityMouseClick(globalLocation:Point) {
        mbbr.topLeft.x = globalLocation.x
        mbbr.topLeft.y = globalLocation.y
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
        guard let gmURL = URL(string:"https://www.linkpicture.com/q/istockphoto-1307238756-170667a.jpg") else {
            fatalError("Failed to create URL for GAMEMENU")
        }
        gm = Image(sourceURL:gmURL)
        guard let gmb1URL = URL(string:"https://www.linkpicture.com/q/New-Piskel_3.png") else {
            fatalError("Failed to create URL for GAMEMENUBUTTON1")
        }
        gmb1 = Image(sourceURL:gmb1URL)
        guard let gm2URL = URL(string:"https://www.linkpicture.com/q/New-Project_27.png") else {
            fatalError("Failed to create URL for GAMEMENUBUTTON2")
        }
        gm2 = Image(sourceURL:gm2URL)
        // Using a meaningful name can be helpful for debugging
        super.init(name:"bgLayer")
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(ground)
        canvas.setup(grass)
        canvas.setup(rock)
        canvas.setup(entrance)
        canvas.setup(gm)
        canvas.setup(gm2)
        canvas.setup(gmb1)
        csx = canvasSize.width
        csy = canvasSize.height

        //other
        dispatcher.registerEntityMouseClickHandler(handler:self)
    }

    override func teardown() {
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }

    override func boundingRect() -> Rect {
        return Rect(size: Size(width: Int.max, height: Int.max))
    }
    
    override func render(canvas:Canvas) {
        if ground.isReady && grass.isReady && rock.isReady && gamestart == true {
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
        if gamestart == false {
            if gm.isReady && gmb1.isReady && gm2.isReady{
                gm.renderMode = .destinationRect(Rect(topLeft:Point(x: 0 - csx / 4 , y: 0 - csy / 4), size:Size(width: csx * 3 / 2, height: csy * 3 / 2)))
                canvas.render(gm)
                
                gmb1.renderMode = .destinationRect(Rect(topLeft:Point(x: csx / 2 - csx / 6 / 2, y: csy / 2 - csy / 13 / 2 + 60), size:Size(width:csx / 6, height: csy / 14)))
                canvas.render(gmb1)
                
                gm2.renderMode = .destinationRect(Rect(topLeft:Point(x:0 - csx / 15, y: 0 - csy / 15), size:Size(width: csx + csx / 15 * 2, height: csy + csy / 15 * 2)))
                canvas.render(gm2)
            }
        }
    }
    
    override func calculate(canvasSize: Size) {
        let gmb1br = Rect(topLeft:Point(x: csx / 2 - csx / 6 / 2, y: csy / 2 - csy / 13 / 2 + 60), size:Size(width:csx / 6, height: csy / 14))
        
        let containment = mbbr.containment(target: gmb1br)
        
        if !containment.intersection([.overlapsFully]).isEmpty {
            gamestart = true
        }
        
        /*        if gamestart == false && gm.isReady {
                  let rotate = Transform(rotateRadians:radians)
                  setTransforms(transforms:[preTranslate, rotate, postTranslate])
                  radians += 1.0 * Double.pi / 180.0
                  }
                  
                  let menuB1BR = Rect(topLeft:Point(x: csx / 2 - csx / 6 / 2, y: csy / 2 - csy / 13 / 2 + 60), size:Size(csx/6, height: csy / 14))
                  let mouseBR = Rect(topLeft:Point(x:*/
    }
}
