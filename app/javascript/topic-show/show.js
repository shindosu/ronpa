const icon = document.querySelector('.topic-show-icon');
const link = document.querySelector('.div-link');

link.addEventListener("mouseover", (event) => {
  icon.className = "fas fa-arrow-left topic-show-icon fa-3x"
  console.log("hello")
});

link.addEventListener("mouseout", (event) => {
  icon.className = "fas fa-utensils topic-show-icon fa-3x"
  console.log("hello")
});