const esbuild = require("esbuild");
const path = require("path");

esbuild
  .build({
    entryPoints: [path.join(__dirname, "srcts/index.tsx")],
    bundle: true,
    outfile: path.join(__dirname, "inst/app/www/index.js"),
    platform: "node",
    format: "cjs",
    external: ["Shiny", "HTMLWidgets"],
    loader: {
      ".ttf": "dataurl",
    },
    define: {
      "process.env.NODE_ENV": JSON.stringify("development"),
    },
    watch: {
      onRebuild(error, result) {
        if (error) console.error("watch build failed:", error);
        else console.log("watch build succeeded:", result);
      },
    },
    // sourcemap: process.env.mode === "PRODUCTION" ? false : true,
    sourcemap: false,
  })
  .catch((err) => {
    process.stderr.write(err.stderr);
    process.exit(1);
  });
