
const formElement = document.querySelectorAll('#argument_content');

const submitForm = () => {
  formElement.forEach((element) =>
    element.addEventListener('blur', function(event) {
      element.parentNode.parentNode.submit();
       element.parentNode.parentNode.preventDefault();
    }
  ))};

export { submitForm };
