var config, fs, jade, locals, str, sty, stylus;

fs = require('fs');

jade = require('jade');

stylus = require('stylus');

config = require('../cfg/config.json').cfg;

locals = {
  pretty: true,
  self: true,
  config: config
};

fs.writeFile('./index.html', jade.renderFile('tpl/index.jade', locals), function(error) {
  if (error) {
    console.log(error);
  }
  return console.log('Successfully rendered index.html');
});

sty = function(style) {
  return style.set('paths', [__dirname + '/sty']);
};

str = fs.readFileSync('./sty/main.styl', 'utf8');

stylus(str).set('filename', './sty/main.styl').use(sty).render(function(error, css) {
  if (error) {
    console.log(error);
  }
  fs.writeFileSync('./css/main.css', css, 'utf8');
  return console.log('Successfully rendered ./css/main.css');
});
