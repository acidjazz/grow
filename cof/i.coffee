
I =
  i: ->

    I.handlers()
    I.budcalc()
    I.dabcalc()

  handlers: ->

    $('.calcs > .calc.budcalc > .inputs > .group > .input > .tinput > input'). on 'keyup', I.budcalc
    $('.calcs > .calc.budcalc > .inputs > .group > .input > .tinput > input'). on 'change', I.budcalc

    $('.calcs > .calc.dabcalc > .inputs > .group > .input > .tinput > input'). on 'keyup', I.dabcalc
    $('.calcs > .calc.dabcalc > .inputs > .group > .input > .tinput > input'). on 'change', I.dabcalc

## outputs
# ppl = pound per light, cpc = cost per crop, cpp = cost per pound
# ppc = profit per crop, ppp = profit per pound, ipy = income per year
## inputs
# lir = lights in room, cpy = crops produced a year, meb = month elec bill
# snc = soil and nutrient cost per crop, rpm = rent per month, mcb = misc cost per crop
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


  dabcalc: ->

    got = I.g 'dabcalc', 'got'
    lcb = I.g 'dabcalc', 'lcb'
    tpc = I.g 'dabcalc', 'tpc'
    mcb = I.g 'dabcalc', 'mcb'
    gcb = I.g 'dabcalc', 'gcb'
    gwp = I.g 'dabcalc', 'gwp'
    spc = I.g 'dabcalc', 'spc'

    wyi = gwp / got
    I.s 'dabcalc', 'wyi', wyi

    cwp = lcb + tpc + mcb + gcb
    I.s 'dabcalc', 'cwp', cwp

    ppg = ((spc * gwp) - cwp) / gwp
    I.s 'dabcalc', 'ppg', ppg

    ppb = (gwp-spc) - cwp
    I.s 'dabcalc', 'ppb', ppb

    console.log got, lcb, tpc, mcb, gcb, gwp, spc

  g: (calc, el) ->
    return parseFloat($(".calcs > .calc.#{calc} > .inputs > .group > .input.#{el} > .tinput > input").val())

  s: (calc, el, val) ->

    val = (Math.round(val * 100) / 100).toFixed(2)
    $(".calcs > .calc.#{calc} > .outputs > .output.#{el} > .value > span.v").html I.nf val

  nf: (num) ->
    num.toString().replace /\B(?=(\d{3})+(?!\d))/g, ","



