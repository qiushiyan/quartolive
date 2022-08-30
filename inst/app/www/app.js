$(document).on("shiny:busy", function (event) {
  const overlay = document.createElement("div");
  overlay.id = "overlay";

  overlay.innerText = "hello wolrd";
  if (document.getElementById("overlay") == null) {
    document.getElementById("preview-pane").appendChild(overlay);
  }
});

$(document).on("shiny:value", function (event) {
  document.querySelectorAll("#overlay").forEach(function (e) {
    e.remove();
  });
});
