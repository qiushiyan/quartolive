import loader from "@monaco-editor/loader";
import { reload_preview, send_editor_code } from "./utils";
import Split from "split.js";
import { createChunkProposals } from "./snippets/insertChunk";
import { insertChunk } from "./actions/insertChunk";

loader.init().then((monaco) => {
  const wrapper = document.getElementById("quarto-editor")!;

  monaco.languages.register({ id: "quarto" });

  const properties = {
    language: "markdown",
    minimap: { enabled: false },
    automaticLayout: true,
    value: getInitialCode(),
  };

  const editor = monaco.editor.create(wrapper, properties);

  // snippets
  monaco.languages.registerCompletionItemProvider("markdown", {
    provideCompletionItems: function (model, position) {
      var word = model.getWordUntilPosition(position);
      var range = {
        startLineNumber: position.lineNumber,
        endLineNumber: position.lineNumber,
        startColumn: word.startColumn,
        endColumn: word.endColumn,
      };
      return {
        suggestions: createChunkProposals(range),
      };
    },
  });

  // shortcuts

  editor.addCommand(
    monaco.KeyMod.CtrlCmd | monaco.KeyMod.WinCtrl | monaco.KeyCode.KeyI,
    () => insertChunk(editor, "r")
  );

  editor.addCommand(
    monaco.KeyMod.CtrlCmd | monaco.KeyMod.WinCtrl | monaco.KeyCode.KeyP,
    () => insertChunk(editor, "python")
  );

  editor.addCommand(
    monaco.KeyMod.CtrlCmd | monaco.KeyMod.WinCtrl | monaco.KeyCode.KeyJ,
    () => insertChunk(editor, "julia")
  );

  editor.addCommand(
    monaco.KeyMod.CtrlCmd | monaco.KeyMod.WinCtrl | monaco.KeyCode.KeyO,
    () => insertChunk(editor, "ojs")
  );

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

Split(["#editor-pane", "#preview-pane"]);

function getInitialCode() {
  return [
    "---",
    "title: 'Using Quarto'",
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
