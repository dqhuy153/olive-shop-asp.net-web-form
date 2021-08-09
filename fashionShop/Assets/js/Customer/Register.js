checkAllInput();
//checkPass();
//checkEmailType();

// kiểm tra input rỗng
function checkAllInput() {
    var formList = document.querySelectorAll('.require');
    formList.forEach(e => {
        var input = e.querySelector('input');
        var warning = e.querySelector('.warning');
        const serverWarning = e.querySelector('.txt__error');
        if (input !== null) {
            document.addEventListener("submit", () => {
                if (input.value == "" && serverWarning.style.display === 'none')
                    warning.classList.add('warning-active')
                else warning.classList.remove('warning-active');
            });

            input.addEventListener("focusout", function () {
                if (input.value == "" && serverWarning.style.display === 'none')
                    warning.classList.add('warning-active')
                else warning.classList.remove('warning-active');
            });
        }
    })
}
// kiểm tra khớp password
//function checkPass() {
//    var password = document.getElementById('password');
//    var checkPass = document.querySelector('.passwordCheck')
//    var rePassword = document.getElementById('rePassword');
//    var checkRePass = document.querySelector('.rePasswordCheck');
//    password.addEventListener('input', () => {
//        if (password.value.length <= 6) {
//            checkPass.innerHTML = '<i class="fal fa-times"></i> Passwords must be at least 7 characters';
//            checkPass.style.display = 'block';
//        }
//        else {
//            checkPass.style.display = 'none';
//        }
//    })
//    rePassword.addEventListener("input", () => {
//        if (rePassword.value == '') {
//            checkRePass.innerHTML = '<i class="fal fa-times"></i> You must reentered a password.';
//        }
//        else if (password.value != rePassword.value) {
//            checkRePass.innerHTML = '<i class="fal fa-times"></i> Your passwords do not match.';
//            checkRePass.style.display = 'block';
//        }
//        else {
//            checkRePass.style.display = 'none';
//        }
//    });
//}
//// kiểm tra hợp lệ email
//function checkEmailType() {
//    var formList = document.querySelectorAll('.require');
//    var emailInput = formList[0].querySelector('input');
//    var emailWarning = formList[0].querySelector('span');
//    var reg_email = /^[A-Za-z0-9]+([_\.\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\.\-]?[A-Za-z0-9]+)*(\.[A-Za-z]+)+$/;
//    emailInput.addEventListener('focusout', () => {
//        if (reg_email.test(emailInput.value) == false) {
//            emailWarning.innerHTML = '<i class="fal fa-times"></i> Please use a valid email address, such as user@example.com.';
//            emailWarning.classList.add('warning-active');
//        }
//        else {
//            emailWarning.classList.remove('warning-active');
//        }
//    })
//}

