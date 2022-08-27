import loader from "@monaco-editor/loader";
import { reload_preview } from "./utils";

loader.init().then((monaco) => {
  const wrapper = document.getElementById("app")!;
  // monaco.languages.register({ id: "quarto" });

  const properties = {
    value: "# Heading 1",
    language: "markdown",
  };

  const editor = monaco.editor.create(wrapper, properties);

  Shiny.addCustomMessageHandler("knit", function (message: any) {
    Shiny.setInputValue!("quarto_code", editor.getValue());
  });

  Shiny.addCustomMessageHandler("refresh_preview", (message: any) => {
    reload_preview();
  });
});
