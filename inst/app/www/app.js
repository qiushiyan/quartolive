$(document).on("shiny:busy", function (event) {
  const preview_out = document.getElementById("preview-out");
  const overlay = document.getElementById("overlay");
  if (preview_out) {
    preview_out.style.display = "none";
  }

  if (overlay) {
    overlay.style.display = "flex";
  }
});

$(document).on("shiny:value", function (event) {
  const preview_out = document.getElementById("preview-out");
  const overlay = document.getElementById("overlay");

  if (preview_out) {
    preview_out.style.display = "initial";
  }

  if (overlay) {
    overlay.style.display = "none";
  }
});
