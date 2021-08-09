checkAllInput();

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