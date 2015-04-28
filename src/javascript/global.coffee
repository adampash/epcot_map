# Browserify entry point for the global.js bundle (yay CoffeeScript!)

$ = require 'jquery'
require './jquery.rwdImageMaps'
# require './jquery.maphilight'
data = require './data'

$ ->
  $('img[usemap]').rwdImageMaps()
  $('map area').on 'click', ->
    console.log 'clicked!'
    $el = $(@)
    bootstrap($el)
    false

  bootstrap = ($el) ->
    $('.selected.pulse').removeClass('selected pulse')
    $el.addClass('selected pulse')
    info = data[$el.attr('id')]
    $('.best_text').removeClass('hidden').find('h3 a').text(info.headline).attr('href', info.url)
    $('.best_text p').text info.text
    console.log info
