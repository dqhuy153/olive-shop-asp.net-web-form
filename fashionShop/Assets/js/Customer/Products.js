const tabletMediaProductsPage = window.matchMedia("(max-width: 769px)");

const filterItemsElementTablet = document.querySelector(".menu--condition__items-tablet");
const filterItemsElement = document.querySelector(".menu--condition__items");
const filterAvailable = document.getElementById("available");
const filterSize = document.getElementById("size");
const filterItemHeaderLeftElements = document.querySelectorAll(".menu--left");
const filterItemHeaderRightElements = document.querySelector(".menu--right");
const filterContainerHeaderEl = document.querySelector(".filter--tablet-header");
const filterIndicatorOnEl = document.querySelector(".indicator-on");
const filterIndicatorOffEl = document.querySelector(".indicator-off");
const clearAvailabilityBtn = document.getElementById("hplClearFeatured");
const clearSizeBtn = document.getElementById("hlpClearSize");
const childEl = filterItemHeaderRightElements.querySelector(".menu--child");

//close filter when click outside
document.addEventListener("click", (e) => {
    console.log(e.target)
    if (!e.target.closest(".menu--item")) {
        childEl.classList.remove('block-visible');
        filterItemHeaderLeftElements[0].querySelector(".menu--child").classList.remove('block-visible');
        filterItemHeaderLeftElements[1].querySelector(".menu--child").classList.remove('block-visible');
    }
})


//response postiton of filter
function checkTabletMedia() {
    if (tabletMediaProductsPage.matches) {
        filterItemsElementTablet.appendChild(filterAvailable);
        filterItemsElementTablet.appendChild(filterSize);
    }
    else {
        filterItemsElement.insertAdjacentElement("afterbegin", filterSize);
        filterItemsElement.insertAdjacentElement("afterbegin", filterAvailable);
    }
}

checkTabletMedia();
window.addEventListener("resize", checkTabletMedia);

//prevent bubbling click of clear btn
clearAvailabilityBtn.addEventListener("click", (e) => {
    e.stopPropagation();
    e.stopImmediatePropagation();
});

clearSizeBtn.addEventListener("click", (e) => {
    e.stopPropagation();
    e.stopImmediatePropagation();
});

//toggle container's filter box (tablet) 
filterContainerHeaderEl.addEventListener('click', () => {
    if (filterItemsElementTablet.classList.contains("block-visible")) {
        filterItemsElementTablet.classList.remove("block-visible");
       
    }
    else {
        filterItemsElementTablet.classList.add("block-visible");
        
    }

    if (tabletMediaProductsPage.matches) {
        if (filterItemsElementTablet.classList.contains("block-visible")) {
            filterIndicatorOffEl.style.display = "initial";
            filterIndicatorOnEl.style.display = "none";
        }
        else {
            filterIndicatorOffEl.style.display = "none";
            filterIndicatorOnEl.style.display = "initial";
        }
    }
});

//toggle item filter box (tablet)
filterItemHeaderLeftElements.forEach(el => el.addEventListener("click", (event) => {
    const childEl = el.querySelector(".menu--child");
    const downIcon = el.querySelector(".ti-angle-down");
    const upIcon = el.querySelector(".ti-angle-up");

    if (childEl.classList.contains("block-visible")) {
        childEl.classList.remove("block-visible");      
    }
    else {
        childEl.classList.add("block-visible");
       
    }

    if (tabletMediaProductsPage.matches) {
        if (childEl.classList.contains("block-visible")) {
            downIcon.style.display = "none";
            upIcon.style.display = "initial";
        }
        else {
            upIcon.style.display = "none";
            downIcon.style.display = "initial";
        }
    } 
}));

//toggle sort filter{

filterItemHeaderRightElements.addEventListener('click', () => {
    childEl.classList.toggle("block-visible");
});
