import Foundation
import Igis

/*
 This main code is responsible for starting Igis and initializing
 the Director.
 It rarely needs to be altered.
 */

/*class Painter : PainterBase {

    let frame : Path
    let frameWidth : Double = 1366
    let frameHeight : Double = 768
    let backgroundFillStyle = FillStyle(color:Color(.black))

    var scaleTransform = Transform()
    var offsetTransform = Transform()
    var windowSize : Size?

    required init() {
        let frameWidthInt = Int(frameWidth)
        let frameHeightInt = Int(frameHeight)
        frame = Path(fillMode:.clear)
        frame.rect(Rect(topLeft:Point(), size:Size(width:frameWidthInt, height:frameHeightInt)))
    }

    override func onWindowResize(size:Size) {
        windowSize = size
    }

    func calculateTransforms(canvas:Canvas) {
        if let newCanvasSize = windowSize {
            canvas.canvasSetSize(size:newCanvasSize)
            let newCanvasWidth = Double(newCanvasSize.width)
            let newCanvasHeight = Double(newCanvasSize.height)

            if newCanvasWidth / newCanvasHeight >= frameWidth / frameHeight {
                let scale = newCanvasHeight / frameHeight
                let offset = (newCanvasWidth - frameWidth * scale) * 0.5
                offsetTransform = Transform(translate:DoublePoint(x:offset, y:0), mode:.fromIdentity)
                scaleTransform = Transform(scale:DoublePoint(x:scale, y:scale), mode:.fromCurrent)
            } else {
                let scale = newCanvasWidth / frameWidth
                let offset = (newCanvasHeight - frameHeight * scale) * 0.5
                offsetTransform = Transform(translate:DoublePoint(x:0, y:offset), mode:.fromIdentity)
                scaleTransform = Transform(scale:DoublePoint(x:scale, y:scale), mode:.fromCurrent)
            }
            windowSize = nil
        }
    }
    func clearCanvas(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize {
            let canvasRect = Rect(topLeft:Point(), size:canvasSize)
            let canvasClearRectangle = Rectangle(rect:canvasRect, fillMode:.clear)
            canvas.render(canvasClearRectangle)
        }
    }
    override func render(canvas:Canvas) {
        calculateTransforms(canvas:canvas)
        if let canvasSize = canvas.canvasSize {
            canvas.render(Transform())
            let canvasRect = Rect(topLeft:Point(), size:canvasSize)
            let canvasRectangle = Rectangle(rect:canvasRect, fillMode:.fill)
            canvas.render(backgroundFillStyle, canvasRectangle, offsetTransform, scaleTransform, frame)
            // Render everything else
        }
    }
}


 */


print("Starting...")
do {
    let igis = Igis()
    try igis.run(painterType:ShellDirector.self)
} catch (let error) {
    print("Error: \(error)")
}
