## outputs
# ppl = pound per light, cpc = cost per crop, cpp = cost per pound
# ppc = profit per crop, ppp = profit per pound, ipy = income per year
## inputs
# lir = lights in room, cpy = crops produced a year, meb = month elec bill
# snc = soil and nutrient cost per crop, rpm = rent per month, mcp = misc cost per crop
# lpc = pounds per crop, spp = sale price per pound
##
# lcpm = labor cost per month
# tcpc = trim cost per pound
#
# formula: ppl = lpc / lir
# formula: cpc = snc + (meb*12) / cpy + (rpm * 12) / cpy + mcp
# formula: cpp = (cpc/ppc)
# formula: ppc = (spp * lpc) - cpc
# formual: ppp = ppc / lpc
# formual: ipy = ppc * cpy
# 

I =
  i: ->

    I.handlers()
    I.calc()

  handlers: ->

    $('.inputs > .group > .input > .tinput > input'). on 'keyup', I.change
    $('.inputs > .group > .input > .tinput > input'). on 'change', I.change

  change: ->
    I.calc()

  calc: ->

    lpc = I.g 'lpc'
    cpy = I.g 'cpy'
    meb = I.g 'meb'
    lir = I.g 'lir'
    rpm = I.g 'rpm'
    mcp = I.g 'mcp'
    tcpp = I.g 'tcpp'
    lcpm = I.g 'lcpm'
    snc = I.g 'snc'
    spp = I.g 'spp'
    cpy = I.g 'cpy'

    I.s 'ppl', lpc / lir

    literal = "snc + (meb * 12) / cpy + (rpm * 12) / cpy + mcp + (tcpp * lpc) + lcpm"
    math ="#{snc} + (#{meb} * 12) / #{cpy} + (#{rpm} * 12) / #{cpy} + #{mcp} + (#{tcpp} * #{lpc}) + #{lcpm}"
    $('.bob').html "#{literal} <br /> #{math}"
    cpc = snc + (meb * 12) / cpy + (rpm * 12) / cpy + mcp + (tcpp * lpc) + lcpm
    I.s 'cpc', cpc
    I.s 'cpp', cpc / lpc
    ppc = (spp * lpc) - cpc
    I.s 'ppc', ppc
    I.s 'ppp', ppc / lpc
    I.s 'ipy', ppc * cpy

  g: (el) ->
    return parseFloat($(".input.#{el} > .tinput > input").val())

  s: (el, val) ->

    val = (Math.round(val * 100) / 100).toFixed(2)
    $(".output.#{el} > .value > span.v").html I.nf val

  nf: (num) ->
    num.toString().replace /\B(?=(\d{3})+(?!\d))/g, ","

