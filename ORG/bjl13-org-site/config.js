module.exports = {
  source: ["tokens/**/*.json"],
  platforms: {
    css: {
      transformGroup: "css",
      buildPath: "static/css/",
      files: [
        {
          destination: "brand.css",
          format: "css/variables",
          options: {
            outputReferences: true,
            selector: ":root",
            showFileHeader: true,
            prefix: "bes",
          },
        },
      ],
    },
    scss: {
      transformGroup: "scss",
      buildPath: "assets/scss/",
      files: [
        {
          destination: "_tokens.scss",
          format: "scss/variables",
          options: {
            outputReferences: true,
            showFileHeader: true,
            prefix: "bes",
          },
        },
      ],
    },
  },
};
