checkAllInput();
//checkEmailType();

function checkAllInput() {
    var inputList = document.querySelectorAll('.input');
    inputList.forEach(e => {
        var inputform = e.querySelector('input');
        var warning = e.querySelector('.warning');
        const serverWarning = e.querySelector('.txt__error');

        document.addEventListener("submit", () => {
            if (inputform.value == "" && serverWarning.style.display === 'none')
                warning.classList.add('warning-active')
            else warning.classList.remove('warning-active');
        });

        inputform.addEventListener('focusout', () => {
            if (inputform.value == "" && serverWarning.style.display === 'none') {
                warning.classList.add('warning-active');           
            }
            else {
                warning.classList.remove('warning-active');
            }
        })
    })
}
//function checkEmailType() {
//    var inputList = document.querySelectorAll('.input');
//    var emailInput = inputList[0].querySelector('input');
//    var emailWarning = inputList[0].querySelector('span');
//    var reg_email = /^[A-Za-z0-9]+([_\.\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\.\-]?[A-Za-z0-9]+)*(\.[A-Za-z]+)+$/;
//    emailInput.addEventListener('focusout', () => {
//        if (reg_email.test(emailInput.value) == false) {
//            emailWarning.classList.add('warning-active');
//        }
//        else {
//            emailWarning.classList.remove('warning-active');
//        }
//    })
//}