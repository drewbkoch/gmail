shell = require 'shell'
ipc = require 'ipc'
remote = require 'remote'
app = remote.require 'app'
bw = remote.getCurrentWindow()
webview = document.getElementById("gmail")

# Open all links in default web browser, not this app
webview.addEventListener 'new-window', (e) ->
  e.preventDefault()
  shell.openExternal(e.url)

# Update title every time page title changes
lastTitle = null
setInterval ->
  title = webview.getTitle()
  if title and title isnt lastTitle
    bw.setTitle title
  lastTitle = title
, 300
