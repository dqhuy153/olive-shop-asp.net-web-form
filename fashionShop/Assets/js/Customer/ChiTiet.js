/*owl-carousel js*/
$('.owl-carousel').owlCarousel({
    loop: true,
    margin: 20,
    nav: true,
    responsive: {

        300: {
            items: 2
        },
        500: {
            items: 3
        },
        800: {
            items: 4
        }
    }
})
/*---------------------------*/
/*product content js  .product__view > .product__view-details*/
var PDetails = document.getElementById("product__view-details");
var Pimgs = document.querySelector('.product__view-imgs');

// console.log(document.documentElement.scrollTop)
// console.log(window.pageYOffset)

// window.onscroll = () => {
//     var limit = Pimgs.offsetTop + Pimgs.offsetHeight;
//     var bottomPdeatails = PDetails.offsetTop + PDetails.offsetHeight;
//     if(limit > bottomPdeatails){
//         PDetails.style.paddingTop = window.pageYOffset - PDetails.offsetTop + 110 + 'px';
//     }
// }

/* change tab onclick*/ 
var options = document.querySelectorAll('.option');
var tabs = document.querySelectorAll('.tab');

function showtab(index){
    tabs.forEach(e => {
        e.style.display = 'none';
    });
    options.forEach(e => {
        e.style.backgroundColor = '';
    })
    options[index].style.backgroundColor = '#fff';
    tabs[index].style.display = 'block';
}
/*-----*/
if(window.innerWidth <= 800){
    Pimgs.classList.add('owl-carousel', 'owl-theme');
}else{
    Pimgs.classList.remove('owl-carousel', 'owl-theme');
}
$('.owl-carousel').owlCarousel({
    loop: true,
    margin: 20,
    nav: true,
    items: 1
})

