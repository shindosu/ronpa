const initIconHover = () => {
  const icon = document.querySelector('.topic-show-icon');
  const link = document.querySelector('.div-link');

  if (icon) {

    const current_class = icon.className;
    link.addEventListener("mouseenter", (event) => {
      icon.className = "fas fa-arrow-left topic-show-icon fa-3x"
    });

    link.addEventListener("mouseout", (event) => {
      icon.className = current_class
    });
  }
}

export {initIconHover};
