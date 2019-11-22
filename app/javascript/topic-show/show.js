const icon = document.querySelector('.topic-show-icon');
const link = document.querySelector('.div-link');
const current_class = document.getElementsByTagName("I")[0].className

console.log(current_class)

link.addEventListener("mouseenter", (event) => {
  icon.className = "fas fa-arrow-left topic-show-icon fa-3x"
});

link.addEventListener("mouseout", (event) => {
  icon.className = current_class
});