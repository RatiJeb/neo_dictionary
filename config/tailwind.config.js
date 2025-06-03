const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        neo: {
          DEFAULT: '#e0ecf9',         // use with `text-neo`
          hover: '#cbdcf1',         // use with `text-neo-hover`
          light: '#ffffff48',         // use with `text-neo-light`
          dark: {
            DEFAULT: '#5291f5',       // use with `text-neo-dark`
            hover: '#3673d3'           // use with `text-neo-dark-hover`
          }
        },
      },
    },
  },
  plugins: [
    // require('@tailwindcss/forms'),
    // require('@tailwindcss/typography'),
    // require('@tailwindcss/container-queries'),
  ]
}
