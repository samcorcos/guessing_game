

Template.random.rendered = ->                           # on render
    number = Math.floor((Math.random() * 100) + 1)      # create a "number" variable, and set it to a random number between 1-100
    Session.set "number", number                        # create a session variable called "number" and set it equal to the randomly generated number

Template.random.helpers
    "number": -> Session.get "number"       # creating "number" helper
    "result": -> Session.get "result"       # creating "result" helper

Template.random.events
    "click #submit": (event, template) ->       # using jQuery, upon clicking the "submit" button,
        guess = $("#guess")[0]?.value
        number = Session.get "number"
        if guess > number
          Session.set "result", "greater"
        else if guess < number
          Session.set "result", "less"
        else if guess is number
          Session.set "result", "you win"
        else
          Session.set "result", "?"
