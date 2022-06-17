/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./app/**/*.{html,js,erb}"],
  theme: {
    extend: {
      colors: {
        fond_gris: "#f5f6f8",
        fond_blue: "#3778c2",
        fond_vert: "#5fb523",
        text_gray: "#434b54",
        text_gray_1: "#555e67",
        text_gray_2: "#878a8f",
        text_gray_3: "#989da3",
      }
    },
  },
  plugins: [],
}