if Meteor.isClient
    Template.random.rendered = ->                           # on render
        newRandomNumber()

    Template.random.helpers
        "number": -> Session.get "number"       # creating "number" helper
        "result": -> Session.get "result"       # creating "result" helper

    Template.random.events
        "click #submit": (event, template) -> submit()       # using jQuery, upon clicking the "submit" button, activate the submit function below

    submit = ->
        guess = parseInt($('#guess')[0]?.value)
        number = Session.get 'number'
        if guess > number
            Session.set "result", "above"
        else if guess < number
            Session.set "result", "below"
        else if guess is number
            Session.set "result", "equals"
            Meteor.setTimeout newRandomNumber, 1000
        else
            Session.set "result", ""

    newRandomNumber = ->
        number = Math.floor((Math.random() * 100) + 1)  # create a "number" variable, and set it to a random number between 1-100
        Session.set "number", number
        Session.set "result", ""

# create a function that creates a css element that brings the color closer to where we need to be
