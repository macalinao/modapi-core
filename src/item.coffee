###
item

Contains things related to items.
###
main = require "../main"

###
Item

The Item base.
An Item is any type of thing that can be put into an inventory.
###
Item = Base.define
    name: "Material"

    properties:
        ###
        STATIC
        ###
        
        # The name of the item.
        name: "Generic Item"

        # The maximum size of the itemstack of the item.
        maxStackSize: 64

        # The model of the item.
        model: main.model.cube

        # The display name of the item.
        displayName: (-> @name)()

        ###
        INSTANCE
        ###

        # The amount of the item.
        amount: "Number"

    init: ->
        # TODO: ?

    create: (entity) ->
        # TODO: ?

###
Block

Represents a type of block. This is also an item.
###
Block = Item.extend
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
basic

Basic stuff.
###
basic = {}

###
Air

The Air block.
###
basic.Air = Block.define name: "Air", obstacle: no, opacity: 0, ->
    @collision.strategy = main.collision.strategy.nocollide

###
skybox

The skybox.
###
basic.Skybox = Block.define name: "Skybox", ->
    @collision.strategy = main.collision.strategy.nocollide

# Export
exports.basic = basic

exports.Item = Item
exports.Block = Block
