// function hasClass(ele, cls) {
//     return !!ele.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
// }

// function addClass(ele, cls) {
//     if (!hasClass(ele, cls)) ele.className += " " + cls;
// }

// function removeClass(ele, cls) {
//     if (hasClass(ele, cls)) {
//         const reg = new RegExp('(\\s|^)' + cls + '(\\s|$)');
//         ele.className = ele.className.replace(reg, ' ');
//     }
// }

// function init() {
//     document.getElementById("open-menu").addEventListener("click", toggleMenu);
//     document.getElementById("body-overlay").addEventListener("click", toggleMenu);
// }

// //The actual fuction
// function toggleMenu() {
//     const ele = document.getElementsByTagName('body')[0];
//     if (!hasClass(ele, "menu-open")) {
//         addClass(ele, "menu-open");
//     } else {
//         removeClass(ele, "menu-open");
//     }
// }

// //Prevent the function to run before the document is loaded
// document.addEventListener('readystatechange', function() {
//     if (document.readyState === "complete") {
//         init();
//     }
// });

// export { toggleMenu };
