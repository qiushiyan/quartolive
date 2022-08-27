import { editor } from "monaco-editor";

export const reload_preview = () => {
  const iframe = document.getElementById("preview_frame") as HTMLIFrameElement;
  if (iframe !== null) {
    iframe.contentWindow!.location.reload();
  }
};

export const send_editor_code = (editor: editor.IStandaloneCodeEditor) => {
  Shiny.setInputValue!("quarto_code", editor.getValue());
};
