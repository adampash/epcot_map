# Browserify entry point for the global.js bundle (yay CoffeeScript!)

$ = require 'jquery'
require './jquery.rwdImageMaps'

$ ->
  $('img[usemap]').rwdImageMaps()
  $('map area').on 'click', ->
    console.log 'clicked!'
    $el = $(@)
    $el.addClass('selected pulse')
    false
