
const box1 = document.getElementById("box1");

const marginSlider = document.getElementById("marginSlider");
const borderSlider = document.getElementById("borderSlider");
const paddingSlider = document.getElementById("paddingSlider");

const marginValue = document.getElementById("marginValue");
const borderValue = document.getElementById("borderValue");
const paddingValue = document.getElementById("paddingValue");

marginSlider.addEventListener("input", () => {
  const value = marginSlider.value + "px";
  box1.style.margin = value;
  marginValue.innerText = value;
});

borderSlider.addEventListener("input", () => {
  const value = borderSlider.value + "px";
  box1.style.borderWidth = value;
  borderValue.innerText = value;
});

paddingSlider.addEventListener("input", () => {
  const value = paddingSlider.value + "px";
  box1.style.padding = value;
  paddingValue.innerText = value;
});
