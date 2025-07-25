/** @type {import('tailwindcss').Config} */
module.exports = {
  mode: "jit",
  content: ["./views/**/*.*", "./assets/**/*.*"],
  theme: {
    extend: {
      colors: {
        myBlue: "#334EAC",
        mylightBlue: "#BAD6EB",
        myWhite: "#FFFFFF",
        myBeige: "#FFF9EF",
      },
      fontFamily: {
        saira: "'Saira', sans-serif",
        montserrat: "'Montserrat', sans-serif",
        oswald: "'Oswald', sans-serif",
      },
      backgroundImage: {
        watermark: "url('/assets/graphics/watermark.png')",
        watermarkUniverse: "url('/assets/graphics/watermark-universe.png')",
        myBackgroundDesktop:
          "url('/assets/graphics/my-background-desktop.png')",
        myBackgroundMobile: "url('/assets/graphics/my-background-mobile.png')",
      },
    },
    plugins: [],
  },
};
