import loader from "@monaco-editor/loader";
import { reload_preview, send_editor_code } from "./utils";
import Split from "split.js";
// import { insertChunk, registerInsertCommand } from "./actions/insertChunk";

loader.init().then((monaco) => {
  const wrapper = document.getElementById("quarto-editor")!;

  const properties = {
    language: "markdown",
    minimap: { enabled: false },
    automaticLayout: true,
    value: getInitialCode(),
  };

  const editor = monaco.editor.create(wrapper, properties);

  // shortcuts
  // registerInsertCommand(editor);

  // interaction with shiny
  document.addEventListener("keydown", (event) => {
    if (event.ctrlKey && event.key == "K") {
      // knit
      send_editor_code("quarto_code", editor.getValue(), "preview");
    } else if (event.ctrlKey && event.key == "S") {
      // format
      send_editor_code("quarto_code_raw", editor.getValue(), "format");
    }
  });

  Shiny.addCustomMessageHandler("knit", function (message: KnitMessage) {
    send_editor_code(`quarto_code`, editor.getValue(), message.prefix);
  });

  Shiny.addCustomMessageHandler("reload_preview", (message: any) => {
    reload_preview();
  });

  Shiny.addCustomMessageHandler(
    "update_code",
    function (message: UpdateCodeMessage) {
      editor.getModel()!.setValue(message.code);
    }
  );
});

Split(["#editor-pane", "#preview-pane"], { sizes: [40, 60] });

function getInitialCode() {
  return [
    "---",
    "title: 'Using Quarto'",
    "format: html",
    "---",
    " ",
    "Using R",
    " ",
    "```{r}",
    "#| layout-ncol: 2",
    "plot(cars)",
    "plot(mtcars)",
    "```",
    " ",
    "Using Python",
    " ",
    "```{python}",
    "import this",
    "```",
  ].join("\n");
}
