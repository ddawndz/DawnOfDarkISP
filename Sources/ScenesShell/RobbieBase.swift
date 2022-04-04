import Scenes

class RobbieBase : Layer {
    let robbie = Robbie()

    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Robbie")

        // We insert our RenderableEntities in the constructor
        insert(entity:robbie, at:.inFrontOf(object:bgLayer))
    }
}
