import Scenes

class LayerBase : Layer {
    let bglayer = bgLayer()

    init(backgroundSpeed: Int) {
        super.init(name:"bgLayer")
        insert(entity:bglayer, at:.back)
    } 
}
