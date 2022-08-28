import { editor } from "monaco-editor";

export const reload_preview = (prefix: string) => {
  const iframe = document.getElementById(
    `${prefix}-preview_frame`
  ) as HTMLIFrameElement;
  if (iframe !== null) {
    iframe.contentWindow!.location.reload();
  }
};

export const send_editor_code = (
  label: string,
  code: string,
  prefix: string = ""
) => {
  if (prefix) {
    label = `${prefix}-${label}`;
  }
  Shiny.setInputValue!(label, code);
};
