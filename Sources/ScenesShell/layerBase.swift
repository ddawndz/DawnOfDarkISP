import Scenes

class LayerBase : Layer {
    let bglayer = bgLayer()

    init() {
        super.init(name:"bgLayer")
        insert(entity:bglayer, at:.back)
    } 
}
