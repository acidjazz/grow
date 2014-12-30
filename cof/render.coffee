
fs = require 'fs'
jade = require 'jade'
stylus = require 'stylus'

locals =
  pretty: true
  self: true
  config: '../cfg/config.json'

fs.writeFile './index.html', jade.renderFile('tpl/index.jade', locals), (err) ->
  if err then console.log err
  console.log 'Successfully rendered index.html'

stylus.render
  filename: 'sty/main.styl'
  , (error, css) ->
    if err then console.log err
    fs.writeFile 'css/main.css', css, (err) ->
      if err then console.log err
      console.log 'Successfully rendered main.css'
