
## outputs
# ppl = pound per light, cpc = cost per crop, cpp = cost per pound
# ppc = profit per crop, ppp = profit per pound, ipy = income per year
# formula: ppl = lpc / lir
## inputs
# lir = lights in room, cpy = crops produced a year, meb = month elec bill
# snc = soil and nutrient cost per crop, rpm = rent per month, misc cost per crop
# lpc = pounds per crop, spp = sale price per pound
##

I =
  i: ->

    I.handlers()

  handlers: ->

    $('.inputs > .group > .input > .tinput > input'). on 'keyup', I.change

  change: ->
    I.calc()

  calc: ->

    lir = $('.input.lir > .tinput > input').val()
    lpc = $('.input.lpc > .tinput > input').val()

    I.set 'ppl', I.get('lpc') / I.get('lir')

  get: (el) ->
    return $(".input.#{el} > .tinput > input").val()

  set: (el, val) ->

    val = (Math.round(val * 10) / 10).toFixed(2)
    $(".output.#{el} > .value > span.v").html val



