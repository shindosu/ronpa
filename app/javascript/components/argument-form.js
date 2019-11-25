
const formElement = document.querySelector('.argument-form');

const submitForm = () => {
  formElement.addEventListener('blur', event => {
    formElement.submit();
  });
};



export { submitForm };
