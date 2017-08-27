module.exports = {
  config: {
    fontSize: 16,
    fontFamily: '"Hack", "Lucida Console", monospace',
    cursorColor: '#3ec7a0',
    cursorShape: 'BEAM',
    foregroundColor: '#fff',
    backgroundColor: '#000',
    borderColor: '#3ec7a0',
    css: '',
    termCSS: '',
    showHamburgerMenu: '',
    showWindowControls: '',
    padding: '12px 14px',
    colors: {
      black: '#000000',
      red: '#ff0000',
      green: '#33ff00',
      yellow: '#ffff00',
      blue: '#0066ff',
      magenta: '#cc00ff',
      cyan: '#00ffff',
      white: '#d0d0d0',
      lightBlack: '#808080',
      lightRed: '#ff0000',
      lightGreen: '#33ff00',
      lightYellow: '#ffff00',
      lightBlue: '#0066ff',
      lightMagenta: '#cc00ff',
      lightCyan: '#00ffff',
      lightWhite: '#ffffff'
    },
    shell: 'C:\\Program Files\\Git\\bin\\bash.exe',
    shellArgs: ['--login', '-i'],
    env: {},
    bell: false,
    copyOnSelect: true,
    windowSize: [1200, 750],
    hyperRun: ['cd /d/Git'],
    hyperRunTab: ['cd /d/Git']
  },
  plugins: [
    'hyper-run'
  ],
  localPlugins: []
};
