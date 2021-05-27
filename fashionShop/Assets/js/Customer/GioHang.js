var cartBox = document.querySelectorAll('.cart__more-box');
var cartContent = document.querySelectorAll('.box-content');

function clickBox(index){
    cartContent.forEach(index => {
        index.style.display = 'none';
    });

    cartContent[index].style.display = 'block';
}

/*------------------------------------*/ 

var forms = document.querySelectorAll('.cart__total-form')
var cartValueOpen = document.querySelectorAll('.cartValue-open')
var cartValueClose = document.querySelectorAll('.cartValue-close');   

for (let i = 0; i < cartValueOpen.length; i++) {
    cartValueOpen[i].onclick = () => {
        cartValueOpen[i].style.display = 'none';
        cartValueClose[i].style.display = 'block';

        forms[i].style.display = 'block';
    }

    cartValueClose[i].onclick = () => {
        cartValueOpen[i].style.display = 'block';
        cartValueClose[i].style.display = 'none';
        forms[i].style.display = 'none';
    }
}

/*--------------------------*/
var insc = document.querySelectorAll('.inscrease');
var dec = document.querySelectorAll('.descrease');
var quali = document.querySelectorAll('.quality');
let prices = document.querySelectorAll('.item--price'); 
let totalItemsPrice = document.querySelectorAll('.item--totalPrice');
let totalCartPrice = document.getElementById('lbTotalCart');



for (let i = 0; i < insc.length; i++) {
    insc[i].onclick = () => {
        //quali[i].value++;
        let sum = 0;

        totalItemsPrice[i].innerText = (++quali[i].value * (+prices[i].innerText.replace(',', '.'))).toFixed(2);

        totalItemsPrice.forEach(i => sum += (+i.innerText.replace(',', '.')));
        totalCartPrice.innerText = sum.toFixed(2);
    }
}
for (let i = 0; i < dec.length; i++) {
    dec[i].onclick = () => {
        if (quali[i].value > 1) {
            //quali[i].value--;
            let sum = 0;

            totalItemsPrice[i].innerText = (--quali[i].value * (+prices[i].innerText.replace(',', '.'))).toFixed(2);

            totalItemsPrice.forEach(i => sum += (+i.innerText.replace(',', '.')));
            totalCartPrice.innerText = sum.toFixed(2);
        }
           
    }
}

/*pop up checkout section*/
var btnCheckout = document.querySelector('.checkout-btn');
var wrapper = document.querySelector('.wrapper');
var innerCheckout = document.querySelector('.checkout-popup')
var overLay = document.querySelector('.over-lay');



btnCheckout.addEventListener('click', () => {
    wrapper.classList.remove('hidden');
    innerCheckout.classList.add('appear-popup');
})

overLay.addEventListener('click', () => {
    wrapper.classList.add('hidden');
    innerCheckout.classList.remove('appear-popup');
}) 

