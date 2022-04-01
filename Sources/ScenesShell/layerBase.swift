import Scenes

class LayerBase : Layer {
    let bglayer = bgLayer(backgroundSpeed: 3)

    init(backgroundSpeed: Int) {
        super.init(name:"bgLayer")
        insert(entity:bglayer, at:.back)
    }
}
