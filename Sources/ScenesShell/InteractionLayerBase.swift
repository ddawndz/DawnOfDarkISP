import Scenes

class InteractionLayerBase : Layer {
    let Interaction = InteractionLayer()

    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")

        // We insert our RenderableEntities in the constructor
    }
}
