# Browserify entry point for the global.js bundle (yay CoffeeScript!)

$ = require 'jquery'
# require './jquery.rwdImageMaps'
data = require './data'

$ ->
  # $('img[usemap]').rwdImageMaps()
  $('svg rect, svg circle').on 'click', ->
    console.log 'clicked!'
    $el = $(@)
    $el = $el.next('circle') unless $el.is('circle')
    # debugger
    bootstrap($el)
    false

  bootstrap = ($el) ->
    $('.selected.pulse').attr(class: '')
    $el.attr(class: 'selected pulse')
    info = data[$el.attr('id')]
    $('.best_text').removeClass('hidden').find('h3 a').text(info.headline).attr('href', info.url)
    $('.best_text p').text info.text
    console.log info
