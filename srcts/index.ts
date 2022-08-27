import loader from "@monaco-editor/loader";
import { reload_preview, send_editor_code } from "./utils";

loader.init().then((monaco) => {
  const wrapper = document.getElementById("app")!;
  // monaco.languages.register({ id: "quarto" });

  const properties = {
    value: "# Heading 1",
    language: "markdown",
  };

  const editor = monaco.editor.create(wrapper, properties);

  // editor.addAction({
  //   id: "knit",
  //   label: "Knit Quarto Document",
  //   keybindings: [
  //     monaco.KeyMod.CtrlCmd | monaco.KeyCode.Shift | monaco.KeyCode.KeyK,
  //   ],
  //   run: () => {
  //     alert("Knit!");
  //   },
  // });

  document.addEventListener("keydown", (event) => {
    // event.stopPropagation();
    // event.preventDefault();

    if (event.ctrlKey && event.key == "K") {
      send_editor_code(editor);
    }
  });

  Shiny.addCustomMessageHandler("knit", function (message: any) {
    send_editor_code(editor);
  });

  Shiny.addCustomMessageHandler("refresh_preview", (message: any) => {
    reload_preview();
  });
});
