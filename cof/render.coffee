
fs = require 'fs'
jade = require 'jade'
stylus = require 'stylus'
config = require '../cfg/config.json'
  .cfg

locals =
  pretty: true
  self: true
  config: config


fs.writeFile './index.html', jade.renderFile('tpl/index.jade', locals), (error) ->
  console.log error if error
  console.log 'Successfully rendered index.html'



# define variables/etc from config you need in stylus
sty = (style) ->
  style.set 'paths', [__dirname + '/sty']

str = fs.readFileSync './sty/main.styl', 'utf8'
stylus(str).set('filename', './sty/main.styl').use(sty).render (error, css) ->
    console.log error if error
    fs.writeFileSync './css/main.css', css, 'utf8'
    console.log 'Successfully rendered ./css/main.css'
