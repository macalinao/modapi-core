###
block

Contains the standard Block prototype.
###
item = require "./item"

###
block

Represents a type of block. This is also an item.
###
block = exports.block = item.item.extend
    name: "Block"

    # Properties
    properties:
        ###
        STATIC
        ###

        # The friction of the block.
        friction: 0

        # The hardness of the block.
        hardness: 0

        # The luminosity of the block, from 0x0 to 0xf.
        luminosity: 0

        # The opacity of the block, 0x0 to 0xf.
        # Opacity represents the amount of light that is blocked.
        opacity: 0xf

        # True if this block is an obstacle. 
        #
        # If the block is not an obstacle,
        # placing a block on it will replace the block.
        obstacle: yes

        # True if this block is affected by physics and .
        physics: no

        # The model of the block.
        model: main.model.cube

        # The collision model of the block.
        collision: main.collision.model.cube

        # Checks if the block is opaque.
        isOpaque: (-> @opacity is 0xf)()

        # Checks if the block has a collision.
        hasCollision: (-> @collision.strategy isnt main.collision.strategy.nocollide)()

        # Checks if the block is solid.
        isSolid: (-> @collision.strategy is main.collision.strategy.solid)()

        # Checks if the block blocks light.
        isOccluding: (-> @collision.isOccluding())()

        # Gets the bounding area of the block.
        getBoundingArea: (-> @collision.boundingArea)()

        ###
        INSTANCE
        ###

        # The position of the block.
        position: type("Position")

    init: ->
        # TODO: Add the block to the game.

    create: (entity) ->
        # TODO: Create a block item.

###
air

The air block.
###
air = block.extend
    name: "Air"
    properties:
        obstacle: no
        opacity: 0
    init: ->
        @collision.strategy = main.collision.strategy.nocollide

###
skybox

The skybox.
###
skybox = block.extend
    name: "Skybox"
    init: ->
        @collision.strategy = main.collision.strategy.nocollide

# Export
exports.block = block
exports.air = air
exports.skybox = skybox
