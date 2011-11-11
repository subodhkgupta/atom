$ = require 'jquery'

Document = require 'document'

module.exports =
class Browser extends Document
  @register (path) -> /^https?:/.test path

  path: null
  html: $ "<div id='browser'></div>"
  iframe: ->
    $ "<iframe src='#{@path}' style='width:100%;height:100%'></iframe>"

  constructor: (@path) ->
    @html.html @iframe().bind 'load', (e) =>
      window.setTitle e.target.contentWindow.document.title
    @show()

    super()
