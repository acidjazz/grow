var I;

I = {
  i: function() {
    I.handlers();
    return I.calc();
  },
  handlers: function() {
    $('.inputs > .group > .input > .tinput > input').on('keyup', I.change);
    return $('.inputs > .group > .input > .tinput > input').on('change', I.change);
  },
  change: function() {
    return I.calc();
  },
  calc: function() {
    var cpc, cpy, lcpm, lir, lpc, mcp, meb, ppc, rpm, snc, spp, tcpp;
    lpc = I.g('lpc');
    cpy = I.g('cpy');
    meb = I.g('meb');
    lir = I.g('lir');
    rpm = I.g('rpm');
    mcp = I.g('mcp');
    tcpp = I.g('tcpp');
    lcpm = I.g('lcpm');
    snc = I.g('snc');
    spp = I.g('spp');
    cpy = I.g('cpy');
    I.s('ppl', lpc / lir);
    cpc = snc + (meb * 12) / cpy + (rpm * 12) / cpy + mcp + (tcpp * lpc) + lcpm;
    I.s('cpc', cpc);
    I.s('cpp', cpc / lpc);
    ppc = (spp * lpc) - cpc;
    I.s('ppc', ppc);
    I.s('ppp', ppc / lpc);
    return I.s('ipy', ppc * cpy);
  },
  g: function(el) {
    return parseFloat($(".input." + el + " > .tinput > input").val());
  },
  s: function(el, val) {
    val = (Math.round(val * 100) / 100).toFixed(2);
    return $(".output." + el + " > .value > span.v").html(I.nf(val));
  },
  nf: function(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
};
