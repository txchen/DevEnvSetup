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
function toggleApp (appName, bundleName) {
  const foremostApp = App.focused()
  if (foremostApp && foremostApp.bundleIdentifier() === bundleName) {
    // Phoenix.log(foremostApp.name())
    foremostApp.hide()
    return
  }
  App.launch(appName, { focus: true })
}

const appsToToggle = {
  // alt + 1, iterm
  'com.googlecode.iterm2': { title: 'iTerm', modifiers: ['alt'], key: '1' },
  // alt + q, vscode
  'com.microsoft.VSCode': { title: 'Visual Studio Code', modifiers: ['alt'], key: 'q' },

  // alt + 2, edge
  'com.microsoft.edgemac': { title: 'Microsoft Edge', modifiers: ['alt'], key: '2' },
  //// alt + 2, vivaldi
  //'com.vivaldi.Vivaldi': { title: 'Vivaldi', modifiers: ['alt'], key: '2' },
  //// alt + w, chrome
  //'com.google.Chrome': { title: 'Google Chrome', modifiers: ['alt'], key: 'w' },
  // alt + w, firefox
  'org.mozilla.firefox': { title: 'Firefox', modifiers: ['alt'], key: 'w' },

  // alt + 3, notion
  'notion.id': { title: 'Notion', modifiers: ['alt'], key: '3' },
  // alt + e, fsnotes
  'co.fluder.FSNotes': { title: 'FSNotes', modifiers: ['alt'], key: 'e' },
  //// alt + e, obsidian
  //'md.obsidian': { title: 'Obsidian', modifiers: ['alt'], key: 'e' },
  // alt + shift + 3, ms todo
  'com.microsoft.to-do-mac': { title: 'Microsoft To Do', modifiers: ['alt', 'shift'], key: '3' },
  // alt + shift + e, apple notes
  'com.apple.Notes': { title: 'Notes', modifiers: ['alt', 'shift'], key: 'e' },

  // alt + 4, telegram
  'ru.keepcoder.Telegram': { title: 'Telegram', modifiers: ['alt'], key: '4' },
  //// alt + 4, slack
  //'com.tinyspeck.slackmacgap': { title: 'Slack', modifiers: ['alt'], key: '4'},
  // alt + r, discord
  'com.hnc.Discord': { title: 'Discord', modifiers: ['alt'], key: 'r'},

  // alt + 5, safari
  'com.apple.Safari': { title: 'Safari', modifiers: ['alt'], key: '5'},

  // file explorer
  'com.apple.finder': { title: 'Finder', modifiers: ['cmd'], key: 'e' },
}
const appBundlesToToggle = Object.keys(appsToToggle)

appBundlesToToggle.forEach(b => Key.on(appsToToggle[b].key, appsToToggle[b].modifiers, () => toggleApp(appsToToggle[b].title, b)))

/* disable switch by hint, it is not very stable
// f16 (right alt) to switch windows by showing hints
let hints = {} // key = hintKey, value = { win, modal }
let hintkeys = []
let hintsActive = false
let escbind = null
let delbind = null
const HINT_BUTTON = 'f16'
const HINT_MODIFIERS = [  ]
const HINT_CHARS = 'fjdkslaghrueiwovncmbxqpzty'.split('') // I only support single char hint, I would not open too many windows

function cancelHints () {
  for (let hintkey in hints) {
    hints[hintkey].modal.close()
  }
  Key.off(escbind)
  Key.off(bsbind)
  hintkeys.map(Key.off)
  hints = {}
  hintkeys = []
  hintsActive = false
}

function showHints () {
  if (hintsActive) {
    cancelHints()
    return
  }
  const allWindows = Window.all({ visible: true })
  buildHints(allWindows)
  HINT_CHARS.forEach(hintchar => {
    hintkeys.push(Key.on(hintchar, [], () => {
      const activator = hints[hintchar]
      if (activator) {
        activator.win.focus()
      }
      cancelHints()
    }))
  })
}

function buildHints (windows) {
  if (windows.length > HINT_CHARS.length) {
    windows = windows.slice(0, HINT_CHARS.length) // sorry, cannot support too long
  }

  const screenModalCounts = {} // key: screen, value: count
  windows.forEach((win, i) => {
    if (win.title().length === 0 || appBundlesToToggle.includes(win.app().bundleIdentifier())) {
      return
    }
    const title = `${HINT_CHARS[i].toUpperCase()}  =>  ${win.title().substr(0, 25) + (win.title().length > 25 ? "…" : "")}`
    const ws = win.screen()
    const wsf = ws.frame()
    const hintModal = Modal.build({
      text: title,
      appearance: 'dark',
      icon: win.app().icon(),
      weight: 16,
      animationDuration: 0
    })
    const mf = hintModal.frame()
    const si = ws.identifier()
    screenModalCounts[si] = (screenModalCounts[si] ? screenModalCounts[si] : 0) + 1
    const indexInScreen = screenModalCounts[si] // one based
    const cellAdjustment = Math.floor(indexInScreen / 2) * (indexInScreen % 2 ? 1 : -1)
    hintModal.origin = {
      x: wsf.x + wsf.width / 2 - mf.width / 2,
      y: wsf.y + wsf.height / 2 + cellAdjustment * (mf.height + 5)
    }
    // Phoenix.log(win.title(), cellAdjustment, mf.height, si, indexInScreen)
    // Phoenix.log(JSON.stringify(hintModal.origin))
    hints[HINT_CHARS[i]] = {
      win,
      modal: hintModal
    }
  })
  escbind = Key.on('escape', [], cancelHints)
  bsbind = Key.on('delete', [], cancelHints) // delete is actually backspace
  Object.values(hints).forEach(act => act.modal.show())
  hintsActive = true
}

Key.on(HINT_BUTTON, HINT_MODIFIERS, showHints)
*/
