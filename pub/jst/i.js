var I;

I = {
  i: function() {
    I.handlers();
    I.budcalc();
    return I.dabcalc();
  },
  handlers: function() {
    $('.calcs > .calc.budcalc > .inputs > .group > .input > .tinput > input').on('keyup', I.budcalc);
    $('.calcs > .calc.budcalc > .inputs > .group > .input > .tinput > input').on('change', I.budcalc);
    $('.calcs > .calc.dabcalc > .inputs > .group > .input > .tinput > input').on('keyup', I.dabcalc);
    return $('.calcs > .calc.dabcalc > .inputs > .group > .input > .tinput > input').on('change', I.dabcalc);
  },
  budcalc: function() {
    var cpc, cpy, lcpm, lir, lpc, mcp, meb, ppc, rpm, snc, spp, tcpp;
    lpc = I.g('budcalc', 'lpc');
    cpy = I.g('budcalc', 'cpy');
    meb = I.g('budcalc', 'meb');
    lir = I.g('budcalc', 'lir');
    rpm = I.g('budcalc', 'rpm');
    mcp = I.g('budcalc', 'mcp');
    tcpp = I.g('budcalc', 'tcpp');
    lcpm = I.g('budcalc', 'lcpm');
    snc = I.g('budcalc', 'snc');
    spp = I.g('budcalc', 'spp');
    cpy = I.g('budcalc', 'cpy');
    I.s('budcalc', 'ppl', lpc / lir);
    cpc = snc + (meb * 12) / cpy + (rpm * 12) / cpy + mcp + (tcpp * lpc) + lcpm;
    I.s('budcalc', 'cpc', cpc);
    I.s('budcalc', 'cpp', cpc / lpc);
    ppc = (spp * lpc) - cpc;
    I.s('budcalc', 'ppc', ppc);
    I.s('budcalc', 'ppp', ppc / lpc);
    return I.s('budcalc', 'ipy', ppc * cpy);
  },
  dabcalc: function() {
    var cwp, gcb, got, gwp, lcb, mcb, ppb, ppg, spc, tpc, wyi;
    got = I.g('dabcalc', 'got');
    lcb = I.g('dabcalc', 'lcb');
    tpc = I.g('dabcalc', 'tpc');
    mcb = I.g('dabcalc', 'mcb');
    gcb = I.g('dabcalc', 'gcb');
    gwp = I.g('dabcalc', 'gwp');
    spc = I.g('dabcalc', 'spc');
    wyi = gwp / got;
    I.s('dabcalc', 'wyi', wyi);
    cwp = lcb + tpc + mcb + gcb;
    I.s('dabcalc', 'cwp', cwp);
    ppg = ((spc * gwp) - cwp) / gwp;
    I.s('dabcalc', 'ppg', ppg);
    ppb = (gwp * spc) - cwp;
    I.s('dabcalc', 'ppb', ppb);
    return console.log(got, lcb, tpc, mcb, gcb, gwp, spc);
  },
  g: function(calc, el) {
    return parseFloat($(".calcs > .calc." + calc + " > .inputs > .group > .input." + el + " > .tinput > input").val());
  },
  s: function(calc, el, val) {
    val = (Math.round(val * 100) / 100).toFixed(2);
    return $(".calcs > .calc." + calc + " > .outputs > .output." + el + " > .value > span.v").html(I.nf(val));
  },
  nf: function(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
};
