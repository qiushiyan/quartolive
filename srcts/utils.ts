export const reload_preview = () => {
  const iframe = document.getElementById("preview_frame") as HTMLIFrameElement;
  if (iframe !== null) {
    iframe.contentWindow!.location.reload();
  }
};
