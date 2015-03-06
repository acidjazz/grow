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
    var cpc, cpy, lpc, ppc;
    lpc = I.g('lpc');
    cpy = I.g('cpy');
    I.s('ppl', lpc / I.g('lir'));
    cpc = I.g('snc') + (I.g('meb') * 12) / cpy + (I.g('rpm') * 12) / cpy + I.g('mcp') + (I.g('tcpp') * lpc) + (I.g('lcpm') * cpy);
    I.s('cpc', cpc);
    I.s('cpp', cpc / lpc);
    ppc = (I.g('spp') * lpc) - cpc;
    I.s('ppc', ppc);
    I.s('ppp', ppc / lpc);
    return I.s('ipy', ppc * I.g('cpy'));
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
