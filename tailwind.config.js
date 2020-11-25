const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  purge: [],
  theme: {
    extend: {
      colors: {
        primary: 'rgb(var(--color-primary))',
        primaryDark: 'rgb(var(--color-primary-dark))'
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      screens: {
        'hidpi': {
          'raw': '(min-resolution: 2dppx) and (min-width: 1080px)'
        }
      }
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/ui'),
  ],
}
