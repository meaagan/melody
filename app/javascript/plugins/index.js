// Load all the channels within this directory and all subdirectories.
// Plugin files must be named *_plugins.js.

const channels = require.context('.', true, /_plugins\.js$/)
plugins.keys().forEach(channels)
