const HYPER_KEY = [ 'ctrl', 'shift', 'alt', 'cmd' ]

// Window operations
function doOnFocusedWindow (func) {
  const window = Window.focused()
  if (window) {
    func(window)
  }
}

// center current window
Key.on('c', HYPER_KEY, () => {
  doOnFocusedWindow(window => {
    const screenSize = window.screen().flippedVisibleFrame()
    window.setTopLeft({
      x: screenSize.x + (screenSize.width / 2) - (window.frame().width / 2),
      y: screenSize.y + (screenSize.height / 2) - (window.frame().height / 2)
    })
  })
})

// maxmise current window
Key.on('m', HYPER_KEY, () => {
  doOnFocusedWindow(window => {
    window.maximise()
  })
})

// make current window larger
Key.on('=', HYPER_KEY, () => {
  doOnFocusedWindow(window => {
    const wFrame = window.frame()
    const screenSize = window.screen().flippedVisibleFrame()
    const newHeight = Math.min(screenSize.height, wFrame.height * 1.2)
    const newWidth = Math.min(screenSize.width, wFrame.width * 1.2)
    const newFrame = _.cloneDeep(wFrame)
    newFrame.y -= (newHeight - wFrame.height) / 2
    newFrame.x -= (newWidth - wFrame.width) / 2
    newFrame.height = newHeight
    newFrame.width = newWidth
    window.setFrame(newFrame)
  })
})

// make current window smaller
Key.on('-', HYPER_KEY, () => {
  doOnFocusedWindow(window => {
    const wFrame = window.frame()
    const screenSize = window.screen().flippedVisibleFrame()
    const newHeight = Math.max(400, wFrame.height * 0.8)
    const newWidth = Math.max(600, wFrame.width * 0.8)
    const newFrame = _.cloneDeep(wFrame)
    newFrame.y += (wFrame.height - newHeight) / 2
    newFrame.x += (wFrame.width - newWidth) / 2
    newFrame.height = newHeight
    newFrame.width = newWidth
    window.setFrame(newFrame)
  })
})

// move current window to next screen
Key.on('n', HYPER_KEY, () => {
  doOnFocusedWindow(window => {
    const wFrame = window.frame()
    const curScreen = window.screen()
    const nextScren = curScreen.next()
    const curScreenSize = curScreen.flippedVisibleFrame()
    const nextScreenSize = nextScren.flippedVisibleFrame()
    const curRelative = {
      x: (wFrame.x - curScreenSize.x) / curScreenSize.width,
      y: (wFrame.y - curScreenSize.y) / curScreenSize.height,
      width: wFrame.width / curScreenSize.width,
      height: wFrame.height / curScreenSize.height,
    }
    const newFrame = {
        x: Math.round(nextScreenSize.x + curRelative.x * nextScreenSize.width),
        y: Math.round(nextScreenSize.y + curRelative.y * nextScreenSize.height),
        width: Math.round(nextScreenSize.width * curRelative.width),
        height: Math.round(nextScreenSize.height * curRelative.height),
    }
    window.setFrame(newFrame)
  })
})

// window go to top half
Key.on('up', HYPER_KEY, () => {
  doOnFocusedWindow(window => {
    const wFrame = window.frame()
    const screenSize = window.screen().flippedVisibleFrame()
    window.setFrame({
      x: screenSize.x,
      y: screenSize.y,
      width: screenSize.width,
      height: screenSize.height / 2
    })
  })
})
// window go to bottom half
Key.on('down', HYPER_KEY, () => {
  doOnFocusedWindow(window => {
    const wFrame = window.frame()
    const screenSize = window.screen().flippedVisibleFrame()
    window.setFrame({
      x: screenSize.x,
      y: screenSize.y + screenSize.height / 2,
      width: screenSize.width,
      height: screenSize.height / 2
    })
  })
})
// window go to left half, in 1/2, 1/3 or 2/3
Key.on('left', HYPER_KEY, () => {
  horizontalResize('left')
})
// window go to right half, in 1/2, 1/3 or 2/3
Key.on('right', HYPER_KEY, () => {
  horizontalResize('right')
})

function horizontalResize (direction) {
  doOnFocusedWindow(window => {
    const screenSize = window.screen().flippedVisibleFrame()
    const wFrame = window.frame()
    // check if the window is on the edge already
    const onEdge = direction === 'left' ?
      Math.abs(wFrame.x - screenSize.x) < 10 :
      Math.abs(wFrame.x + wFrame.width - screenSize.x - screenSize.width) < 10
    // Phoenix.log(wFrame.x, screenSize.x, onEdge)
    if (!onEdge) { // move it on to edge
      window.setFrame({
        x: direction === 'left' ? screenSize.x : screenSize.x + screenSize.width - wFrame.width,
        y: screenSize.y,
        width: wFrame.width,
        height: screenSize.height
      })
    } else { // already on edge, adjust the ratio
      const currentRatio = wFrame.width / screenSize.width
      let newWidth = Math.floor(screenSize.width / 2) // half
      if (currentRatio < 0.41) {
        newWidth = Math.floor(screenSize.width / 3 * 2) // two thirds
      } else if (currentRatio < 0.55) {
        newWidth = Math.floor(screenSize.width / 3) // one third
      }
      // Phoenix.log(currentRatio, newWidth)
      window.setTopLeft({
        x: direction === 'left' ? screenSize.x : screenSize.x + screenSize.width - newWidth,
        y: screenSize.y
      })
      window.setSize({
        width: newWidth,
        height: screenSize.height
      })
    }
  })
}

// Toggle apps
function toggleApp(appName, bundleName) {
  const foremostApp = App.focused()
  if (foremostApp) {
    if (foremostApp.bundleIdentifier() === 'com.carriez.rustdesk') {
      // ignore toggling when remote desktop is in fullscreen mode
      const window = Window.focused()
      if (window && window.isFullScreen()) {
        return
      }
    }
    if (foremostApp.bundleIdentifier() === bundleName) {
      foremostApp.hide()
      return
    }
  }
  App.launch(appName, { focus: true })
}

const appsToToggle = {
  // alt + 1, kitty
  'net.kovidgoyal.kitty': { title: 'kitty', modifiers: ['alt'], key: '1' },
  //// alt + 1, iterm
  //'com.googlecode.iterm2': { title: 'iTerm', modifiers: ['alt'], key: '1' },
  // alt + q, vscode
  'com.microsoft.VSCode': { title: 'Visual Studio Code', modifiers: ['alt'], key: 'q' },

  // alt + 2, edge
  'com.microsoft.edgemac': { title: 'Microsoft Edge', modifiers: ['alt'], key: '2' },
  // alt + shift + 2, safari
  'com.apple.Safari': { title: 'Safari', modifiers: ['alt', 'shift'], key: '2' },
  // alt + w, firefox
  'org.mozilla.firefox': { title: 'Firefox', modifiers: ['alt'], key: 'w' },
  // alt + shift + w, chrome
  'com.google.Chrome': { title: 'Google Chrome', modifiers: ['alt', 'shift'], key: 'w' },

  // alt + 3, notion
  'notion.id': { title: 'Notion', modifiers: ['alt'], key: '3' },
  // alt + e, onenote
  'com.microsoft.onenote.mac': { title: 'Microsoft OneNote', modifiers: ['alt'], key: 'e' },
  // alt + shift + 3, apple notes
  'com.apple.Notes': { title: 'Notes', modifiers: ['alt', 'shift'], key: '3' },

  // alt + 4, telegram
  'ru.keepcoder.Telegram': { title: 'Telegram', modifiers: ['alt'], key: '4' },
  //// alt + 4, slack
  //'com.tinyspeck.slackmacgap': { title: 'Slack', modifiers: ['alt'], key: '4'},
  // alt + r, discord
  'com.hnc.Discord': { title: 'Discord', modifiers: ['alt'], key: 'r'},

  // file explorer
  'com.apple.finder': { title: 'Finder', modifiers: ['cmd'], key: 'e' },
}
const appBundlesToToggle = Object.keys(appsToToggle)

appBundlesToToggle.forEach(b => Key.on(appsToToggle[b].key, appsToToggle[b].modifiers, () => toggleApp(appsToToggle[b].title, b)))
