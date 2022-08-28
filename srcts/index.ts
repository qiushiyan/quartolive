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

  Shiny.addCustomMessageHandler(
    "reload_preview",
    (message: RefreshPreviewMessage) => {
      reload_preview(message.prefix);
    }
  );

  Shiny.addCustomMessageHandler(
    "update_code",
    function (message: UpdateCodeMessage) {
      editor.getModel()!.setValue(message.code);
    }
  );
});
