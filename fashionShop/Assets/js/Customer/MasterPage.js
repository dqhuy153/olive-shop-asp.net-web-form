//xử dụng cho khi responsive
let header = document.getElementById("header");
let btnToggleMenu = document.getElementById("btnToggleMenu");
let modalMobileMenu = document.getElementById("modalMobileWrap");
let headerMobile = document.getElementById("headerMobile");
let cartQuantity = document.getElementById("cartQuantity");
let headerRightPC = document.getElementById("headerRightPC");
let mainCategoryElement = document.querySelectorAll(
    ".header__menu--items-title"
);
let childCategoryElement = document.querySelectorAll(
    ".navPage-subMenu-items-title"
);
let iconDown = document.querySelectorAll("fa-chevron-down");

let tabletMedia = window.matchMedia("(max-width: 63.9375em)");
let ipadAndPhoneMedia = window.matchMedia("(max-width: 768px)");

const txtEmail = document.getElementById("txtEmail");
const btnSubcribe = document.getElementById("btnSubcribe");
const banner = document.querySelector(".banner");

//Lay chieu cao cua header
let headerHeight = header.clientHeight;

//Tu dong dong khi chon menu
let menuItems = document.querySelectorAll('#nav li a[href *= "#"]');
for (let i = 0; i < menuItems.length; i++) {
    let menuItem = menuItems[i];
    menuItem.onclick = function (event) {
        //console.log(this)
        //Khi đứng tại một thẻ, thì this chính là thẻ mà đang được sử dụng

        let isParentMenu =
            this.nextElementSibling &&
            this.nextElementSibling.classList.contains("subnav");

        if (isParentMenu) {
            //Xử lí lỗi của More
            event.preventDefault();
        } else {
            //nếu mà không phải cha thì ẩn menu đi
            //ẩn menu
            header.style.height = null;
        }
    };
}

function toggleChange() {
    // get the clock
    let subnav = document.getElementsByClassName("subnav");

    // get the current value of the clock's display property
    let displaySetting = myClock.style.display;

    // also get the clock button, so we can change what it says
    let Button = document.getElementById("Button");

    // now toggle the clock and the button text, depending on current state
    if (displaySetting == "block") {
        // clock is visible. hide it
        myClock.style.display = "none";
    } else {
        // clock is hidden. show it
        myClock.style.display = "block";
    }
}

//toggle menu
btnToggleMenu.addEventListener("click", () => {
   
    if (modalMobileMenu.classList.contains("modalMobileVisible")) {
        banner.style.display = "flex";
        modalMobileMenu.classList.remove("modalMobileVisible");
    }
    else {
        banner.style.display = "none"
        modalMobileMenu.classList.add("modalMobileVisible");
    }
});

//check Tablet Media
//moving cart(0) when response
function checkTabletMedia() {
    if (tabletMedia.matches) {
        headerMobile.appendChild(cartQuantity);
        mainCategoryElement.forEach(el => el.href = "#");
        childCategoryElement.forEach(el => el.href = "#");
    } else {
        headerRightPC.appendChild(cartQuantity);
    }
}

window.addEventListener("resize", checkTabletMedia);

checkTabletMedia();
//--

function toggleElement(elements, classToggle, classVisible) {
    elements.forEach((element) => {
        element.addEventListener("click", (e) => {
            element.parentElement
                .querySelector(classToggle)
                .classList.toggle(classVisible);
        });
    });
}
//toggle subnav
toggleElement(mainCategoryElement, ".subnav", "subnavVisible");

//toggle subnav--child
toggleElement(childCategoryElement, ".subnav--child", "subnav--childVisible");


/*button mobile animation */
function menuAnimate() {
	let main = document.getElementById('menuIcon');
	main.classList.toggle('rotate');
	let c = document.getElementById('menuIcon').children;
	c[0].classList.toggle('rotateL');
	c[1].classList.toggle('slick');
    c[2].classList.toggle('rotateR');
    return false;
}

// onclick submit email button
var submit = document.getElementById("btnSubcribe");
var inputEmail = document.getElementById("txtEmail");
inputEmail.addEventListener('click', () => {
    submit.style.display = "inline-block";
})

//popup cart
function popUpCart() {
    var header = document.querySelector('.header');
    var cartItem = document.getElementById('cartQuantityLink');
    var cartPopUp = document.querySelector('.cart-popup')

    document.addEventListener("click", (e) => {
        if (!e.target.closest("#cartQuantityLink")) {
            cartPopUp.classList.remove('appearCartPopup');
            header.classList.remove('changeWhiteBg');
        }
    })

    cartItem.addEventListener('click', () => {
        if (cartPopUp.classList.contains('appearCartPopup')) {
            header.classList.remove('changeWhiteBg');
            cartPopUp.classList.remove('appearCartPopup');        
        }
        else {
            header.classList.add('changeWhiteBg');
            cartPopUp.classList.add('appearCartPopup');          
        }
    })
}

popUpCart();