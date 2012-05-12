###
item

Contains the Item base.
###
main = require "../main"

###
item

The Item base.
An Item is any type of thing that can be put into an inventory.
###

exports.material = Base.define
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

# Setup exports
exports.block = require "./block"