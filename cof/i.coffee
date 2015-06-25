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

    $('.calcs > .calc.budcalc > .inputs > .group > .input > .tinput > input'). on 'keyup', I.budcalc
    $('.calcs > .calc.budcalc > .inputs > .group > .input > .tinput > input'). on 'change', I.budcalc

  budcalc: ->

    lpc = I.g 'budcalc', 'lpc'
    cpy = I.g 'budcalc', 'cpy'
    meb = I.g 'budcalc', 'meb'
    lir = I.g 'budcalc', 'lir'
    rpm = I.g 'budcalc', 'rpm'
    mcp = I.g 'budcalc', 'mcp'
    tcpp = I.g 'budcalc', 'tcpp'
    lcpm = I.g 'budcalc', 'lcpm'
    snc = I.g 'budcalc', 'snc'
    spp = I.g 'budcalc', 'spp'
    cpy = I.g 'budcalc', 'cpy'

    I.s 'budcalc', 'ppl', lpc / lir

    #literal = "snc + (meb * 12) / cpy + (rpm * 12) / cpy + mcp + (tcpp * lpc) + lcpm"
    #math ="#{snc} + (#{meb} * 12) / #{cpy} + (#{rpm} * 12) / #{cpy} + #{mcp} + (#{tcpp} * #{lpc}) + #{lcpm}"
    #$('.bob').html "#{literal} <br /> #{math}"
    #
    cpc = snc + (meb * 12) / cpy + (rpm * 12) / cpy + mcp + (tcpp * lpc) + lcpm
    I.s 'budcalc', 'cpc', cpc
    I.s 'budcalc', 'cpp', cpc / lpc
    ppc = (spp * lpc) - cpc
    I.s 'budcalc', 'ppc', ppc
    I.s 'budcalc', 'ppp', ppc / lpc
    I.s 'budcalc', 'ipy', ppc * cpy

  g: (calc, el) ->
    return parseFloat($(".calcs > .calc.#{calc} > .inputs > .input.#{el} > .tinput > input").val())

  s: (calc, el, val) ->

    val = (Math.round(val * 100) / 100).toFixed(2)
    $(".calcs > .calc.#{calc} > .outputs > .output.#{el} > .value > span.v").html I.nf val

  nf: (num) ->
    num.toString().replace /\B(?=(\d{3})+(?!\d))/g, ","

