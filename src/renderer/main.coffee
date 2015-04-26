shell = require 'shell'
ipc = require 'ipc'
remote = require 'remote'
app = remote.require 'app'
bw = remote.getCurrentWindow()
webview = document.getElementById("gmail")

webview.addEventListener 'new-window', (e) ->
  e.preventDefault()
  shell.openExternal(e.url)


lastTitle = null
setInterval ->
  title = webview.getTitle()
  if title and title isnt lastTitle
    bw.setTitle title
  lastTitle = title
,300
