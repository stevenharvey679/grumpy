Grumpy
======

Nodejs micro-framework written in coffeescript. Has an event-based routing system, which is particularly sweet. Freedom is left to the user about how to manage his routes. If one wants to use async workflows or promises based chains, it is up to him/her and the framework will not enforce its views on him/her.

About the example
=================

##Modules.coffee
Modules.coffee is where you tell the framework where to find the listeners. Each module in this file will be loaded in the server which will then dispatch the events when a request happen.

##myModule.coffee
A very basic example of how to describe an action. We use EventEmitter2 so feel free to see the documentation(https://github.com/asyncly/EventEmitter2). 


What still has to be done
=========================

* Put this in an npm module
* More CLI options to do various things
* Response helpers

What will not be done
=====================

* Pretty much anything else, truly. I do not intend for this to be a big monolithic framework which does everything for you. It is just a little thing that will help you route requests to your functions and that is it. Nothing more. It is everything-agnostic. I am still open to suggestions though, and if it keeps the spirit of minimalism, I will take it.


