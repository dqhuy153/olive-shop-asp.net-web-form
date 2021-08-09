/*owl-carousel js*/
/*owl-carousel js*/
function detailImgSlider() {
    $('.product__detail-imgs').owlCarousel({
        loop: true,
        margin: 20,
        nav: true,
        dots: false,
        items: 1,
        responsiveClass: true
    })
}

function runDetailSection() {
    window.onresize = () => {
        if (window.outerWidth <= 800) {
            detailImgSlider();
        }
        else {
            window.location.reload();
        }
    }
    if (window.outerWidth <= 800) {
        detailImgSlider(0)
    }
}

function sliderRelatedProduct() {
    $('.product__related-slides').owlCarousel({
        loop: true,
        margin: 20,
        nav: true,
        dots: true,
        responsiveClass: true,
        responsive: {
            100: {
                items: 1,
                nav: false
            },
            300: {
                items: 2,
                nav: false
            },
            500: {
                items: 3,
                nav: false
            },
            800: {
                items: 4
            }
        }
    })
}
// tab

var tabs = document.querySelectorAll('.aboutTab');
var content = document.querySelectorAll('.aboutTab-contentItem');
for (let i = 0; i < tabs.length; i++) {
    tabs[i].addEventListener('click', () => {
        tabs[i].classList.add('activeTab');
        content[i].style.display = 'block';
    })
}
function changeTab(index) {
    for (let i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove('activeTab');
        content[i].style.display = 'none';
    }
    tabs[index].classList.add('activeTab');
    content[index].style.display = 'block';
}

function increaseCartQuantity() {
    const cartQuantity = document.getElementById("lbCartQuantity");
    cartQuantity.innerText = +cartQuantity.innerText + 1;
}

/*----------------------------------*/
window.onload = function () {
    const backdrop = document.getElementById("modalAdd__backdrop");
    const modalAddToCart = document.getElementById("modalAdd");

    backdrop.addEventListener("click", () => {
        modalAddToCart.classList.remove("modalAdd__visible");
    });   
}

function handleAddToCart() {
    const ddlSize = document.getElementById("ddlSize");
    const modalAddToCart = document.getElementById("modalAdd");

    if (ddlSize.value == -1) {
        return false;
    }
    else {
        modalAddToCart.classList.add("modalAdd__visible");
        increaseCartQuantity();
        return false;
    }
}

function handleCloseModalAdd() {
    const modalAddToCart = document.getElementById("modalAdd");

    modalAddToCart.classList.remove("modalAdd__visible");
    return false;
}

function handleAddToWishList() {
    swal("Successful!", "Your product's already in your wish list!", "success");
    return false;
}


// 
sliderRelatedProduct();
runDetailSection();


