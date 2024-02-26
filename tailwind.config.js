const tailwindTypography = require("@tailwindcss/typography");

module.exports = {
  content: ["./src/**/*.bs.js"],
  plugins: [tailwindTypography],
  // tailwind.config.js


  theme: {
    extend: {
      fontFamily: {
        minecraftia: ['Minecraftia', 'sans'],
      },
    },
  },

};
