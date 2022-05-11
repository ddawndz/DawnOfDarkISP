import Foundation
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */
class Sprites : RenderableEntity {
    let boySprites : Image
    let robbieSprites : Image
    let fireSprites: Image
    let skelSprites: Image
    let archerSprites: Image
    var count = 0
    var count2 = 0
    var maxCount = 8
    var swap = 0
    var xPos = 0
    var yPos = 0
    var fxPos = 0
    var fyPos = 0
    var downMove = false
    var upMove = false
    var leftMove = false
    var rightMove = false
    var swap2 = 0
    var swap3 = 0
    var count3 = 0
    var count4 = 0
    var count42 = 0
    var current = "down"
    var current2 = "down"
    var slash = false
    var shield = false
    var cast = false
    var upBound = false
    var downBound = false
    var leftBound = false
    var rightBound = false
    var bound = false
    var bound2 = false
    var currentSprite = "main"
    var fireball = false
    var fireSize = 10
    var lives = 5
    var sxPos = 0
    var sxPos2 = 0
    var syPos = 0
    var syPos2 = 0
    var swap4 = 4
    var swap42 = 4
    var direction = 1
    var direction2 = 2
    var count5 = 0
    var count52 = 0
    var skelLives = 4
    var skelLives2 = 4
    var sSlash = false
    var sSlash2 = false
    var slashCount = 22
    var slashCount2 = 22
    var seen = false
    var seen2 = false
    var wait = 0
    var wait2 = 0
    var gamestart = false
    
    init() {
               
        guard let boySpritesURL = URL(string:"https://www.linkpicture.com/q/download-1_133.png") else {
            fatalError("Failed to create URL for whitehouse")
        }

        guard let archerSpritesURL = URL(string:"https://linkpicture.com/q/archer.png") else {
            fatalError("Archer shot itself...")
        }
        
        // https://www.linkpicture.com/q/download_381.png
        guard let robbieSpritesURL = URL(string:"https://linkpicture.com/q/Download35839.png") else {
            fatalError("DevSprites Locked...")
        }
        guard let fireSpritesURL = URL(string:"https://linkpicture.com/q/images-removebg-preview_13.png") else {
            fatalError("Fireball exploded...")
        }
        guard let skelSpritesURL = URL(string:"https://linkpicture.com/q/Download74503.png") else {
            fatalError("Skeleton collapsed...")
        }
        
        //https://linkpicture.com/q/RobbieDevSprites.png
        // sprites for the skeletons, and the main character.
        boySprites = Image(sourceURL:boySpritesURL)
        archerSprites = Image(sourceURL:archerSpritesURL)
        robbieSprites = Image(sourceURL:robbieSpritesURL)
        fireSprites = Image(sourceURL:fireSpritesURL)
        skelSprites = Image(sourceURL:skelSpritesURL)

        super.init(name:"Background")
    }
    
        

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(boySprites)
        canvas.setup(archerSprites)
        canvas.setup(robbieSprites)
        canvas.setup(fireSprites)
        canvas.setup(skelSprites)
        xPos = canvasSize.center.x
        yPos = canvasSize.center.y
        fxPos = xPos
        fyPos = yPos
        sxPos = Int.random(in:1...canvasSize.center.x)
        syPos = Int.random(in:1...canvasSize.center.y)
        sxPos2 = Int.random(in:1...canvasSize.center.x)
        syPos2 = Int.random(in:1...canvasSize.center.y)
        // each time a new sprite is introduced, x and y coordinates are needed.
        

    }

    override func render(canvas:Canvas) {        

        // Easy rendering of skeletons. With this miraculous function, we can make unlimited skeletons, although this might not be a good idea. Yes, I did name the function funco


        
        func funco(skelLives: inout Int, countfour: inout Int, swapfour: inout Int, countfive: inout Int, slashone: inout Int, seenone: inout Bool, sSlashone: inout Bool, waitone: inout Int, boundone: inout Bool, directionone: inout Int, sxPosone: inout Int, syPosone: inout Int) {
            
            if skelSprites.isReady {
            if skelLives < 0 && countfour == 5 {
            } else {
                swapfour += 1
                if swapfour > 3 {
                    swapfour = 0
                    countfour += 1
                    countfive += 1
                    if sSlashone == true {
                        slashone += 3
                    }
                }

                if countfour > 8 {
                    countfour = 0
                    
                }
            }    
            // the part above counts for 3 frames before switching to the next sprites
            if countfive > 20 && seenone == false {
                let chance = Int.random(in:1...10)
                if chance == 4 && waitone < 1 {
                    waitone = 30
                    countfive = 0
                }
                
            }
            // Uses a randomized timer to switch the skeleton direction. A 1 in 10 chance every frame after 20 frames, it runs at 30 frames per second, so on average we go a different direction every second.

            
            
            let downRect = Rect(topLeft:Point(x:(64 * countfour) + 8, y:(10 * 64) + 7), size:Size(width:56, height:56))
            let upRect = Rect(topLeft:Point(x:(64 * countfour) + 8, y:(8 * 64) + 7), size:Size(width:56, height:56))
            let leftRect = Rect(topLeft:Point(x:(64 * countfour) + 8, y:(9 * 64) + 7), size:Size(width:56, height:56))
            let rightRect = Rect(topLeft:Point(x: (64 * countfour) + 8, y:(11 * 64) + 7), size:Size(width:56, height:56))
            let slasher = Rect(topLeft:Point(x: (64 * 4 * 3) + 72, y: (slashone * 64) + 7), size:Size(width:130, height:60))
            
            let deadRect = Rect(topLeft:Point(x: (64 * countfour) + 8, y:(20 * 64) + 7), size:Size(width:56, height: 56))
            let slashRect = Rect(topLeft:Point(x:sxPosone - 25, y:syPosone), size:Size(width:149, height:64))
            let destinationRect = Rect(topLeft:Point(x:sxPosone, y:syPosone), size:Size(width:64, height:64))
            if skelLives < 0 {
                directionone = 100
                if countfour > 5 {
                    countfour = 5
                }
                skelSprites.renderMode = .sourceAndDestination(sourceRect:deadRect, destinationRect:destinationRect)
            }
            // here are the location algebra for the skeletons. It is about 64 frames in between each sprite. I used a pixel counter and then tested it. Also, isn't this swift terminal wacky? I'm writing comments and yet it is highlighting my code. Weird.
            if sSlashone == false {
                switch directionone {
                case 1:
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:downRect, destinationRect:destinationRect)
                    if waitone < 1 {
                    if boundone == false {
                        syPosone += 2
                    } else {
                        directionone = 2
                        syPosone -= 2
                    }
                    }
                case 2:
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:upRect, destinationRect:destinationRect)
                    if waitone < 1 {
                    if boundone == false {
                        syPosone -= 2
                    } else {
                        directionone = 1
                        syPosone += 2
                    }
                    }
                case 3:
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:leftRect, destinationRect:destinationRect)
                    if waitone < 1 {
                    if boundone == false {
                        sxPosone -= 2
                    } else {
                        directionone = 4
                        sxPosone += 2
                    }
                    }
                case 4:
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:rightRect, destinationRect:destinationRect)
                    if waitone < 1 {
                    if boundone == false {
                        sxPosone += 2
                    } else {
                        direction = 3
                        sxPosone -= 2
                    }
                }
                default:
                    break
                }
            }
            
            if waitone > 0 {
                waitone -= 1
                if waitone == 29 {
                    switch directionone {
                    case 1:
                        directionone = 3
                    case 2:
                        directionone = 4
                    case 3:
                        directionone = 1
                    case 4:
                        directionone = 2
                    default:
                        break
                    }
                } else if waitone == 15  {
                    switch directionone {
                    case 3:
                        directionone = 4
                    case 4:
                        directionone = 3
                    case 1:
                        directionone = 2
                    case 2:
                        directionone = 1
                    default:
                        break
                    }
                } else if waitone == 1 {
                    directionone = Int.random(in: 1...4)
                }
                
            }
                        
                        
                
                
            
                if sSlashone == true {
                    if slashone > 31 {
                        sSlashone = false
                        slashone = 22
                        countfour = 0
                    }                                       
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:slasher, destinationRect:slashRect)
                    
                    
                }
                
                
                canvas.render(skelSprites)
            }
        }
        
        
        if downMove == true {
            current = "down"
            swap += 1
            if swap > 1 {
                swap = 0
                count += 1
                if downBound == true {
                } else {
                    yPos += 15
                }
            }
            if count > 8 {
                count = 0
            }
        }
        if upMove == true {
            current = "up"
            swap += 1
            if swap > 1 {
                swap = 0
                count += 1
                if upBound == true {
                } else {
                    yPos -= 15
                }
            }
            if count > 8 {
                count = 0
            }
        }
        if leftMove == true {
            current = "left"
            swap += 1
            if swap > 1 {
                swap = 0
                count += 1
                if leftBound == true {
                } else {
                    xPos -= 15
                }
            }
            if count > 8 {
                count = 0
            }
        }
        if rightMove == true {
            current = "right"
            swap += 1
            //swap2 += 1
            if swap > 1 {
                swap = 0
                count += 1
                if rightBound == true {
                } else {
                    xPos += 15
                }
            }
            if count > 8 {
                count = 0
            }
        }
    
        if slash == true {
            switch (current) {
            case "right":
                current = "rightSlash"
            case "left":
                current = "leftSlash"
            case "up": 
                current = "upSlash"
            case "down": 
                current = "downSlash"
            case "rightShield":
                current = "rightSlash"
            case "leftShield" :
                current = "leftSlash"
            case "upShield":
                current = "upSlash"
            case "downShield":
                current = "downSlash"
            default :
                break
            }

            swap += 1
            swap2 += 1
            
            if swap > 2  {
                swap = 0
                count += 1
            }
            
            if swap2 > 15 {
                slash = false
                swap2 = 0
                count = 0
            }
            if count > 5 {
                count = 0
            }
        }
        if shield == true {
            if current == "right" {
                current = "rightShield"
            }
            if current == "left" {
                current = "leftShield"
            }
            if current == "up" {
                current = "upShield"
            }
            if current == "down" {
                current = "downShield"
            }
            if current == "rightSlash" {
                current = "rightShield"
            }
            if current == "leftSlash" {
                current = "leftShield"
            }
            if current == "upSlash" {
                current = "upShield"
            }
            if current == "downSlash" {
                current = "downShield"
            }

            swap += 1
            if swap > 1 {
                swap = 0
                count += 1
            }
            if count > 6 {
                count = 6
            }
        }
        if cast == true && currentSprite == "robbie" {
            if current == "right" {
                current = "rightCast"
            }
            if current == "left" {
                current = "leftCast"
            }
            if current == "up" {
                current = "upCast"
            }
            if current == "down" {
                current = "downCast"
            }
            if current == "rightSlash" {
                current = "rightCast"
            }
            if current == "leftSlash" {
                current = "leftCast"
            }
            if current == "upSlash" {
                current = "upCast"
            }
            if current == "downSlash" {
                current = "downCast"
            }
            if current == "rightShield" {
                current = "rightCast"
            }
            if current == "leftShield" {
                current = "leftCast"
            }
            if current == "upShield" {
                current = "upCast"
            }
            if current == "downShield" {
                current = "downCast"
            }
            if current == "downCast" {
                current2 = "down"
            }
            if current == "upCast" {
                current2 = "up"
            }
            if current == "leftCast" {
                 current2 = "left"
            }
            if current == "rightCast" {
                current2 = "right"
            }
            
            swap += 1
            swap2 += 1
            if swap > 7 {
                swap = 0
                count += 1
            }
            if swap2 > 49 {
                cast = false
                 swap2 = 0
                count = 0
            }
            if count > 6 {
                count = 0
            }
        }


        if fireball == true {
            swap3 += 1
            if swap3 > 2 {
                swap3 = 0
                count2 += 1
            }
            if current2 == "right" {

                if count3 > 30 {
                    fxPos += 7
                }
                if fireSize > 175 {
                } else {
                fyPos -= 1
                fireSize += 2
                }
                count3 += 1
            }
            if current2 == "left" {
                if count3 > 30 {
                    fxPos -= 7
                }
                if fireSize > 175 {
                } else {
                    fireSize += 2
                    fyPos -= 1
                }
                    count3 += 1
            }
            if current2 == "up" {
                
                if count3 > 30 {
                    fyPos -= 7
                }
                if fireSize > 175 {
                } else {
                fxPos -= 1
                fireSize += 2
                }
                count3 += 1
            }
            if current2 == "down" {
                if count3 > 30 {
                    fyPos += 7
                }
                if fireSize > 175 {
                } else {
                    fireSize += 2
                    fxPos -= 1
                }
                count3 += 1
                
            }
            
            if count2 > 5 {
                count2 =  1
                
            }
        }
        
        if gamestart == true {
            funco(skelLives: &skelLives, countfour: &count4, swapfour: &swap4, countfive: &count5, slashone: &slashCount, seenone: &seen, sSlashone: &sSlash,  waitone: &wait, boundone: &bound, directionone: &direction, sxPosone: &sxPos, syPosone: &syPos)

            funco(skelLives: &skelLives2, countfour: &count42, swapfour: &swap42, countfive: &count52, slashone: &slashCount2, seenone: &seen2, sSlashone: &sSlash2,  waitone: &wait2, boundone: &bound2, directionone: &direction2, sxPosone: &sxPos2, syPosone: &syPos2)
        }
        /*
        if skelSprites.isReady {
            if skelLives < 0 && count4 == 5 {
            } else {
                swap4 += 1
                if swap4 > 3 {
                    swap4 = 0
                    count4 += 1
                    count5 += 1
                    if sSlash == true {
                        slashCount += 3
                    }
                }

                if count4 > 8 {
                    count4 = 0
                    
                }
            }    
            
            if count5 > 20 && seen == false {
                let chance = Int.random(in:1...10)
                if chance == 4 && wait < 1 {
                    wait = 30
                //    direction = Int.random(in:1...4)
                    count5 = 0
                }
                
            }

            
            
            let downRect = Rect(topLeft:Point(x:(64 * count4) + 8, y:(10 * 64) + 7), size:Size(width:56, height:56))
            let upRect = Rect(topLeft:Point(x:(64 * count4) + 8, y:(8 * 64) + 7), size:Size(width:56, height:56))
            let leftRect = Rect(topLeft:Point(x:(64 * count4) + 8, y:(9 * 64) + 7), size:Size(width:56, height:56))
            let rightRect = Rect(topLeft:Point(x: (64 * count4) + 8, y:(11 * 64) + 7), size:Size(width:56, height:56))
            let slasher = Rect(topLeft:Point(x: (64 * 4 * 3) + 72, y: (slashCount * 64) + 7), size:Size(width:130, height:60))
            
            let deadRect = Rect(topLeft:Point(x: (64 * count4) + 8, y:(20 * 64) + 7), size:Size(width:56, height: 56))
            let slashRect = Rect(topLeft:Point(x:sxPos - 25, y:syPos), size:Size(width:149, height:64))
            let destinationRect = Rect(topLeft:Point(x:sxPos, y:syPos), size:Size(width:64, height:64))
            if skelLives < 0 {
                direction = 100
                if count4 > 5 {
                    count4 = 5
                }
                skelSprites.renderMode = .sourceAndDestination(sourceRect:deadRect, destinationRect:destinationRect)
            }
            if sSlash == false {
                switch direction {
                case 1:
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:downRect, destinationRect:destinationRect)
                    if wait < 1 {
                    if bound == false {
                        syPos += 2
                    } else {
                        direction = 2
                        syPos -= 2
                    }
                    }
                case 2:
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:upRect, destinationRect:destinationRect)
                    if wait < 1 {
                    if bound == false {
                        syPos -= 2
                    } else {
                        direction = 1
                        syPos += 2
                    }
                    }
                case 3:
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:leftRect, destinationRect:destinationRect)
                    if wait < 1 {
                    if bound == false {
                        sxPos -= 2
                    } else {
                        direction = 4
                        sxPos += 2
                    }
                    }
                case 4:
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:rightRect, destinationRect:destinationRect)
                    if wait < 1 {
                    if bound == false {
                        sxPos += 2
                    } else {
                        direction = 3
                        sxPos -= 2
                    }
                }
                default:
                    break
                }
            }
            
            if wait > 0 {
                wait -= 1
                if wait == 29 {
                    switch direction {
                    case 1:
                        direction = 3
                    case 2:
                        direction = 4
                    case 3:
                        direction = 1
                    case 4:
                        direction = 2
                    default:
                        break
                    }
                } else if wait == 15  {
                    switch direction {
                    case 3:
                        direction = 4
                    case 4:
                        direction = 3
                    case 1:
                        direction = 2
                    case 2:
                        direction = 1
                    default:
                        break
                    }
                } else if wait == 1 {
                    direction = Int.random(in: 1...4)
                }
                
            }
                        
                        
                
                
            
                if sSlash == true {
                    if slashCount > 31 {
                        sSlash = false
                        slashCount = 22
                        count4 = 0
                    }                                       
                    skelSprites.renderMode = .sourceAndDestination(sourceRect:slasher, destinationRect:slashRect)
                    
                    
                }

                if gamestart == true {
                    canvas.render(skelSprites)
                }
            }
                                    
                canvas.render(skelSprites)
        }
        */


        if gamestart == true {
        if currentSprite == "main" {
            if boySprites.isReady  {

                if lives < 0 {
                    count = 5
                }
                                    
                let downRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 11) + (46 * 10)), size:Size(width:56, height:56))
                let upRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 9) + (46 * 8)), size:Size(width:56, height:56))
                let leftRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 10) + (46 * 9)), size:Size(width:56, height:56))
                let rightRect = Rect(topLeft:Point(x: (64 * count) + 8, y:(11 * 64) + 7), size:Size(width:56, height:56))
                let upSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72, y:(22 * 64) + 7), size:Size(width:129, height:56))
                let leftSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72 - 25, y:(25 * 64) + 7), size:Size(width:129, height:56))
                let downSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72, y:(28 * 64) + 7), size:Size(width:130, height:60))
                let rightSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72 - 25, y:(31 * 64) + 7), size:Size(width:130, height:56))
                let downShield = Rect(topLeft:Point(x:(64 * count) + 8, y: (6 * 64) + 7), size:Size(width:56, height:56))
                let upShield = Rect(topLeft:Point(x:(64 * count) + 8, y: (4 * 64) + 7), size:Size(width:56, height:56))
                let leftShield = Rect(topLeft:Point(x:(64 * count) + 8, y:(5 * 64) + 7), size:Size(width:56, height:56))
                let rightShield = Rect(topLeft:Point(x: (64 * count) + 8, y:(7 * 64) + 7), size:Size(width:56, height:56))
                let deadRect = Rect(topLeft:Point(x: (64 * count) + 8, y:(20 * 64) + 7), size:Size(width:56, height: 56))

                let destinationRect = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:64, height:64))
                let slashRect = Rect(topLeft:Point(x:xPos - 25, y:yPos), size:Size(width:149, height:84))
                
                if current == "down" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:downRect, destinationRect:destinationRect)
                }
                if current == "up" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:upRect, destinationRect:destinationRect)
                }
                if current == "left" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:leftRect, destinationRect:destinationRect)
                }
                if current == "right" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:rightRect, destinationRect:destinationRect)
                }
                if current == "upSlash" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:upSlash, destinationRect:slashRect)
                }
                if current == "leftSlash" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:leftSlash, destinationRect:slashRect)
                }
                if current == "downSlash" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:downSlash, destinationRect:slashRect)
                }
                if current == "rightSlash" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:rightSlash, destinationRect:slashRect)
                }
                if current == "downShield" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:downShield, destinationRect:destinationRect)
                }
                if current == "upShield" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:upShield, destinationRect:destinationRect)
                }
                if current == "leftShield" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:leftShield, destinationRect:destinationRect)
                }
                if current == "rightShield" {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:rightShield, destinationRect:destinationRect)
                }
                if lives < 0 {
                    boySprites.renderMode = .sourceAndDestination(sourceRect:deadRect, destinationRect:destinationRect)
                }
                
                    canvas.render(boySprites)
                
            }
        }
        
        
        if currentSprite == "robbie" {
            if robbieSprites.isReady {
                let downRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 11) + (46 * 10)), size:Size(width:56, height:56))
                let upRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 9) + (46 * 8)), size:Size(width:56, height:56))
                let leftRect = Rect(topLeft:Point(x:(64 * count) + 8, y:(17 * 10) + (46 * 9)), size:Size(width:56, height:56))
                let rightRect = Rect(topLeft:Point(x: (64 * count) + 8, y:(11 * 64) + 7), size:Size(width:56, height:56))
                let upSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72, y:(22 * 64) + 7), size:Size(width:129, height:56))
                let leftSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72 - 25, y:(25 * 64) + 7), size:Size(width:129, height:56))
                let downSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72, y:(28 * 64) + 7), size:Size(width:130, height:60))
                let rightSlash = Rect(topLeft:Point(x: (64 * count * 3) + 72 - 25, y:(31 * 64) + 7), size:Size(width:130, height:56))
                let downShield = Rect(topLeft:Point(x:(64 * count) + 8, y: (6 * 64) + 7), size:Size(width:56, height:56))
                let upShield = Rect(topLeft:Point(x:(64 * count) + 8, y: (4 * 64) + 7), size:Size(width:56, height:56))
                let leftShield = Rect(topLeft:Point(x:(64 * count) + 8, y:(5 * 64) + 7), size:Size(width:56, height:56))
                let rightShield = Rect(topLeft:Point(x: (64 * count) + 8, y:(7 * 64) + 7), size:Size(width:56, height:56))
                let downCast = Rect(topLeft:Point(x:(64 * count) + 8, y: (2 * 64) + 7), size:Size(width:56, height:56))
                let upCast = Rect(topLeft:Point(x:(64 * count) + 8, y: (0 * 64) + 7), size:Size(width:56, height:56))
                let leftCast = Rect(topLeft:Point(x:(64 * count) + 8, y:(1 * 64) + 7), size:Size(width:56, height:56))
                let rightCast = Rect(topLeft:Point(x: (64 * count) + 8, y:(3 * 64) + 7), size:Size(width:56, height:56))
                let fireCast = Rect(topLeft:Point(x: 91 / 2 * count2 + 10, y:11), size:Size(width:35, height: 35))
                
                let destinationRect = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:64, height:64))
                let slashRect = Rect(topLeft:Point(x:xPos - 25, y:yPos), size:Size(width:149, height:64))
                let fireRect = Rect(topLeft:Point(x:fxPos, y:fyPos), size:Size(width:fireSize, height: fireSize))
                
                if current == "down" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:downRect, destinationRect:destinationRect)
                }
                if current == "up" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:upRect, destinationRect:destinationRect)
                }
                if current == "left" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:leftRect, destinationRect:destinationRect)
                }
                if current == "right" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:rightRect, destinationRect:destinationRect)
                }
                if current == "upSlash" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:upSlash, destinationRect:slashRect)
                }
                if current == "leftSlash" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:leftSlash, destinationRect:slashRect)
                }
                if current == "downSlash" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:downSlash, destinationRect:slashRect)
                }
                if current == "rightSlash" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:rightSlash, destinationRect:slashRect)
                }
                if current == "downShield" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:downShield, destinationRect:destinationRect)
                }
                if current == "upShield" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:upShield, destinationRect:destinationRect)
                }
                if current == "leftShield" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:leftShield, destinationRect:destinationRect)
                }
                if current == "rightShield" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:rightShield, destinationRect:destinationRect)
                }
                if current == "downCast" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:downCast, destinationRect:destinationRect)
                                        
                }
                if current == "upCast" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:upCast, destinationRect:destinationRect)
                }
                if current == "leftCast" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:leftCast, destinationRect:destinationRect)
                }
                if current == "rightCast" {
                    robbieSprites.renderMode = .sourceAndDestination(sourceRect:rightCast, destinationRect:destinationRect)
                }

                if fireball == true {
                    fireSprites.renderMode = .sourceAndDestination(sourceRect:fireCast, destinationRect:fireRect)
                }
                    if fireball == true {
                        canvas.render(fireSprites)
                    }
                    canvas.render(robbieSprites)
            }
        }
        }
    }
        
        
    

    override func calculate(canvasSize: Size) {

            
        let canvasBoundingRect = Rect(size:canvasSize)
        let mainCharacter = Rect(topLeft:Point(x:xPos, y:yPos), size:Size(width:84, height:84))
        let slashBox = Rect(topLeft:Point(x: xPos - 56, y: yPos - 56), size:Size(width:56 * 3, height:56 * 3))
        let containment = canvasBoundingRect.containment(target: mainCharacter)
        let firebla = Rect(topLeft:Point(x:fxPos, y:fyPos), size:Size(width:fireSize, height:fireSize))
        let containment2 = canvasBoundingRect.containment(target: firebla)


        let skely = Rect(topLeft:Point(x:sxPos, y:syPos), size:Size(width:64, height:64 ))
        let skely2 = Rect(topLeft:Point(x:sxPos2, y:syPos2), size:Size(width:64, height:64))
        let containment3 = canvasBoundingRect.containment(target: skely)
        let containment32 = canvasBoundingRect.containment(target: skely2)
        let seeHorizontal = Rect(topLeft:Point(x:sxPos - (84 * 2), y:syPos - (84)), size:Size(width:84 * 5, height:84 * 3))
        let seeHorizontal2 = Rect(topLeft:Point(x:sxPos2 - (84 * 2), y:syPos2 - 84), size:Size(width:84 * 5, height: 84 * 3))
        let seeVertical = Rect(topLeft:Point(x:sxPos - (84), y:syPos - (84 * 2)), size:Size(width:84 * 3, height:84 * 5))
        let seeVertical2  = Rect(topLeft:Point(x:sxPos2 - (84), y:syPos2 - (84 * 2)), size:Size(width:84 * 3, height:84 * 5))
        let skelyAlign = Rect(topLeft:Point(x:sxPos + 28, y:syPos + 28), size:Size(width:1, height:1))
        let skelyAlign2 = Rect(topLeft:Point(x:sxPos2 + 28, y:syPos2 + 28), size:Size(width:1, height:1))
        let seeAll = Rect(topLeft:Point(x:sxPos - 84 * 2, y:syPos - 84 * 2), size:Size(width:84 * 5, height: 84 * 5))
        let seeAll2 = Rect(topLeft:Point(x:sxPos2 - 84 * 2, y:syPos2 - 84 * 2), size:Size(width:84 * 5, height: 84 * 5))
        let containment7 = seeVertical.containment(target: mainCharacter)
        let containment72 = seeVertical2.containment(target: mainCharacter)
        let containment4 = seeHorizontal.containment(target: mainCharacter)
        let containment42 = seeHorizontal2.containment(target: mainCharacter)
        let containment5 = skely.containment(target: mainCharacter)
        let containment52 = skely2.containment(target: mainCharacter)
        let firedeath = Rect(topLeft:Point(x:fxPos + 5, y:fyPos + 5), size:Size(width:fireSize * 3 / 4, height:fireSize * 3 / 4))
        let containfire = firedeath.containment(target:skely)
        let characterAlign = Rect(topLeft:Point(x: xPos + 28, y: yPos + 28), size:Size(width:1, height:1))
     
        let containment6 = skelyAlign.containment(target:characterAlign)
        let containment62 = skelyAlign2.containment(target:characterAlign)
        let containment8 = slashBox.containment(target:skely)
        let containment82 = slashBox.containment(target:skely2)
        let containment9 = skelyAlign.containment(target:mainCharacter)
        let containment92 = skelyAlign2.containment(target:mainCharacter)
        let containment10 = seeAll.containment(target:mainCharacter)
        let containment102 = seeAll2.containment(target:mainCharacter)

        if !containment.intersection([.overlapsRight, .beyondRight]).isEmpty {
            rightBound = true
        } else {
            rightBound = false
        }

        if !containment2.intersection([.beyondRight]).isEmpty {
            fireball = false
            count3 = 0
        }
        
        if !containment.intersection([.overlapsLeft, .beyondLeft]).isEmpty {
            leftBound = true
        } else {
            leftBound = false
        }
        if !containment2.intersection([ .beyondLeft]).isEmpty {
            fireball = false
            count3 = 0
        }
        if !containment.intersection([.overlapsBottom, .beyondBottom]).isEmpty {
            downBound = true
        } else {
            downBound = false
        }
        if !containment2.intersection([ .beyondBottom]).isEmpty {
            fireball = false
            count3 = 0
        }
        if !containment.intersection([.overlapsTop, .beyondTop]).isEmpty {
            upBound = true
        } else {
            upBound = false
        }
        if !containment2.intersection([ .beyondTop]).isEmpty {
            fireball = false
            count3 = 0
        }

        if !containfire.intersection([.contact]).isEmpty && fireball == true {
            skelLives -= 1
        }
        
        func funca(containmentfour: ContainmentSet, containmentseven: ContainmentSet, skelLives: inout Int, directionone: inout Int, seenone: inout Bool, sxPosone: inout Int, syPosone: inout Int, sSlashone: inout Bool, containmentsix: ContainmentSet, containmenteight: ContainmentSet, containmentnine: ContainmentSet, containmentten: ContainmentSet, boundone: inout Bool, livesone: inout Int, countone: inout Int, slashone: inout Bool, shieldone: inout Bool, slashCountone: inout Int, containmentthree: ContainmentSet, xPosone: inout Int, yPosone: inout Int, containmentfive: ContainmentSet, countfour: inout Int) {
          
        if (!containmentfour.intersection([.contact]).isEmpty || !containmentseven.intersection([.contact]).isEmpty) && skelLives >= 0 {
            if !containmentfour.intersection([.contact]).isEmpty && directionone == 4 {
                seenone = true
            }
            if !containmentfour.intersection([.contact]).isEmpty && directionone == 3 {
                seenone = true
            }
            if !containmentseven.intersection([.contact]).isEmpty && directionone == 1{
                seenone = true
            }
            if !containmentseven.intersection([.contact]).isEmpty && directionone == 2 {
                seenone = true
            }
        }
        
        
        if (!containmentten.intersection([.contact]).isEmpty) && skelLives >= 0 && seenone == true {
            if !containmentfive.intersection([.beyondRight]).isEmpty {
                directionone = 4
                sxPosone += 3
                if !containmentsix.intersection([.beyondBottom]).isEmpty {
                    syPosone += 3
                } else if !containmentsix.intersection([.beyondTop]).isEmpty {
                    syPosone -= 3
                }
            }
            if !containmentfive.intersection([.beyondLeft]).isEmpty {
                directionone = 3
                sxPosone -= 3
                if !containmentsix.intersection([.beyondBottom]).isEmpty {
                    syPosone += 3
                } else if !containmentsix.intersection([.beyondTop]).isEmpty {
                    syPosone -= 3
                } 
            }
            if !containmentfive.intersection([.beyondBottom]).isEmpty {
                directionone = 1
                syPosone += 3
                if !containment6.intersection([.beyondRight]).isEmpty {
                    sxPosone += 3
                } else if !containmentsix.intersection([.beyondLeft]).isEmpty {
                    sxPosone -= 3
                }
            }
            if !containmentfive.intersection([.beyondTop]).isEmpty {
                directionone = 2
                syPosone -= 3
                if !containmentsix.intersection([.beyondRight]).isEmpty {
                    syPosone += 3
                } else if !containmentsix.intersection([.beyondLeft]).isEmpty {
                    syPosone -= 3
                }
            }
        } else {
            seenone = false
        }
        

        if !containmentnine.intersection([.contact]).isEmpty && livesone >= 0 && sSlashone == false && skelLives >= 0 {
            sSlashone = true
            countfour = 0
        }
        
        if !containmenteight.intersection([.contact]).isEmpty && slashone == true && countone > 3 {
            
            switch current {
            case "upSlash":
                syPosone -= 50
            case "upShield":
                syPosone -= 50
            case "downSlash":
                syPosone += 50
            case "downShield":
                syPosone += 50
            case "leftSlash":
                sxPosone -= 50
            case "leftShield":
                sxPosone -= 50
            case "rightSlash":
                sxPosone += 50
            case "rightShield":
                sxPosone += 50
            default:
                break
            }
            if slashone == true {
                skelLives -= 1
            }
        }
        if !containmentfive.intersection([.contact]).isEmpty && shieldone == true && countone > 4 {
            switch current {
            case "upSlash":
                syPosone -= 75
            case "upShield":
                syPosone -= 75
            case "downSlash":
                syPosone += 75
            case "downShield":
                syPosone += 75
            case "leftSlash":
                sxPosone -= 75
            case "leftShield":
                sxPosone -= 75
            case "rightSlash":
                sxPosone += 75
            case "rightShield":
                sxPosone += 75
            default:
                break
            }
        }
        
        if !containmentfive.intersection([.contact]).isEmpty && sSlashone == true && slashCountone > 25 && shieldone == false {
            livesone -= 1
            switch directionone {
            case 1:
                yPosone += 50
            case 2:
                yPosone -= 50
            case 3:
                xPosone -= 50
            case 4:
                xPosone += 50
            default:
                break
            }
            
        }

        if !containmentthree.intersection([.overlapsLeft, .beyondLeft]).isEmpty || !containmentthree.intersection([.overlapsRight, .beyondRight]).isEmpty || !containmentthree.intersection([.overlapsTop, .beyondTop]).isEmpty || !containmentthree.intersection([.overlapsBottom, .beyondBottom]).isEmpty {
            boundone = true
        } else {
            boundone = false
        }
        
        
        
        
        }

        if gamestart == true {
        funca(containmentfour: containment4, containmentseven: containment7, skelLives: &skelLives, directionone: &direction, seenone: &seen, sxPosone: &sxPos, syPosone: &syPos, sSlashone: &sSlash, containmentsix: containment6, containmenteight: containment8, containmentnine: containment9, containmentten: containment10, boundone: &bound, livesone: &lives, countone: &count, slashone: &slash, shieldone: &shield, slashCountone: &slashCount, containmentthree: containment3, xPosone: &xPos, yPosone: &yPos, containmentfive: containment5, countfour: &count4)
        funca(containmentfour: containment42, containmentseven: containment72, skelLives: &skelLives2, directionone: &direction2, seenone: &seen2, sxPosone: &sxPos2, syPosone: &syPos2, sSlashone: &sSlash2, containmentsix: containment62, containmenteight: containment82, containmentnine: containment92, containmentten: containment102, boundone: &bound2, livesone: &lives, countone: &count, slashone: &slash, shieldone: &shield, slashCountone: &slashCount2, containmentthree: containment32, xPosone: &xPos, yPosone: &yPos, containmentfive: containment52, countfour: &count42)
        }
    }
}
