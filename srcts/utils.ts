export const reload_preview = (prefix: string = "") => {
  let class_name = "preview-frame";
  if (prefix) {
    class_name = `${prefix}-${class_name}`;
  }
  const iframes = document.querySelectorAll(`.${class_name}`);
  iframes.forEach((iframe) => {
    if (iframe !== null && iframe instanceof HTMLIFrameElement) {
      iframe.src += "";
    }
  });
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
