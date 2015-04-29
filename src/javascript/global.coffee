# Browserify entry point for the global.js bundle (yay CoffeeScript!)

$ = require 'jquery'
# require './jquery.rwdImageMaps'
data = require './data'

$ ->
  # $('img[usemap]').rwdImageMaps()
  $('svg rect, svg circle').on 'click', ->
    console.log 'clicked!'
    $el = $(@)
    # $el = $el.next('circle') unless $el.is('circle')
    # debugger
    bootstrap($el)
    false
  $('svg rect').on 'mouseover', ->
    $el = $(@)
    info = data[$el.attr('id')]
    $('image.hover').attr(info.coords).attr(class: 'hover')

  $('svg rect').on 'mouseout', ->
    $('image.hover').attr(class: 'hover hidden')

  bootstrap = ($el) ->
    # $('.selected.pulse').attr(class: '')
    # $el.attr(class: 'selected')
    # debugger
    id = $el.attr 'id'
    console.log id
    info = data[$el.attr('id')]
    $('image.active').attr(info.coords).attr(class: 'active').attr(class: 'active pulse')
    $('.best_text').removeClass('hidden').find('h3 a').text(info.headline).attr('href', info.url)
    $('.best_text p').html "#{info.text} <a href=\"#{info.url}\" target=\"_blank\">Read more »</a>"
    console.log info
