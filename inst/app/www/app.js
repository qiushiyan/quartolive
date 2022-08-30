const showSpinner = () => {
  const preview_out = document.getElementById("preview-out");
  const overlay = document.getElementById("overlay");
  if (preview_out) {
    preview_out.style.display = "none";
  }

  if (overlay) {
    overlay.style.display = "flex";
  }
};

const hideSpinner = () => {
  const preview_out = document.getElementById("preview-out");
  const overlay = document.getElementById("overlay");

  if (preview_out) {
    preview_out.style.display = "initial";
  }

  if (overlay) {
    overlay.style.display = "none";
  }
};

$(document).on("shiny:busy", function (event) {
  showSpinner();
});

$(document).on("shiny:value", function (event) {
  hideSpinner();
});

Shiny.addCustomMessageHandler("error", function (message) {
  console.log("error happened");
  hideSpinner();
});
