var fs, jade, locals, stylus;

fs = require('fs');

jade = require('jade');

stylus = require('stylus');

locals = {
  pretty: true,
  self: true,
  config: '../cfg/config.json'
};

fs.writeFile('./index.html', jade.renderFile('tpl/index.jade', locals), function(err) {
  if (err) {
    console.log(err);
  }
  return console.log('Successfully rendered index.html');
});

stylus.render({
  filename: 'sty/main.styl'
}, function(error, css) {
  if (err) {
    console.log(err);
  }
  return fs.writeFile('css/main.css', css, function(err) {
    if (err) {
      console.log(err);
    }
    return console.log('Successfully rendered main.css');
  });
});
