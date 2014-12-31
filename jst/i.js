var I;

I = {
  i: function() {
    return I.handlers();
  },
  handlers: function() {
    return $('.inputs > .group > .input > .tinput > input').on('keyup', I.change);
  },
  change: function() {
    return I.calc();
  },
  calc: function() {
    var lir, lpc;
    lir = $('.input.lir > .tinput > input').val();
    lpc = $('.input.lpc > .tinput > input').val();
    return I.set('ppl', I.get('lpc') / I.get('lir'));
  },
  get: function(el) {
    return $(".input." + el + " > .tinput > input").val();
  },
  set: function(el, val) {
    val = (Math.round(val * 10) / 10).toFixed(2);
    return $(".output." + el + " > .value > span.v").html(val);
  }
};
