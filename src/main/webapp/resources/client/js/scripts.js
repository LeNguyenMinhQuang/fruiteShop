window.addEventListener('DOMContentLoaded', event => {
    //search
    let searchBtn = document.querySelector("#searchBtn");
    searchBtn.addEventListener("click", (e) => {
        e.preventDefault();
        let searchValue = document.querySelector("#searchBar").value;

        let currentUrl2 = new URL(`${window.location.href}`);
        let searchParams = currentUrl2.searchParams;

        console.log(currentUrl2);
        currentUrl2.pathname = "/shop"

        searchParams.delete("category");
        searchParams.delete("price");

        searchParams.set("page", "1");


        searchParams.set("name", searchValue);

        window.location.href = currentUrl2.toString();

    })

    //add quantity in cart page
    let quantityBtns = document.querySelectorAll(".quantityBtn");
    quantityBtns.forEach((btn) => {
        btn.addEventListener("click", () => {
            let numVal = btn.parentElement.getElementsByTagName("span")[0];
            let quantityValue = numVal.innerText;
            let newVal;
            if (btn.classList.contains("plus-cart")) {
                newVal = parseInt(quantityValue) + 1;
            } else if ((btn.classList.contains("minus-cart"))) {
                if (quantityValue > 1) {
                    newVal = parseInt(quantityValue) - 1;
                } else {
                    newVal = 1;
                }
            }

            numVal.innerText = newVal;

            let totalVal = btn.parentElement.nextElementSibling;
            let price = totalVal.getAttribute("product-price");
            let newTotal = parseFloat(price) * newVal;
            totalVal.textContent = `${newTotal.toFixed(1)}$`;

            let totalSubCart = document.getElementById("totalSubCart");
            let totalCart = document.getElementById("totalCart");
            let totalList = document.getElementsByClassName("total-cd");
            let totalVal2 = 0;
            for (let i of totalList) {
                totalVal2 += parseFloat(i.innerText);
            }
            totalCart.textContent = `${totalVal2.toFixed(1)}$`;
            totalSubCart.textContent = `${totalVal2.toFixed(1)}$`;

            let cdIndex = numVal.getAttribute("cdIndex");
            let hiddenCartItem = document.getElementById(`cd-${cdIndex}`);
            hiddenCartItem.setAttribute("value", newVal);
        })
    })


    //add params to url
    let filterBtn = document.querySelector("#btnFilter");
    filterBtn.addEventListener("click", (e) => {
        e.preventDefault();
        let cateList = [];
        let priceList = [];
        let sortValue = document.querySelector("#sortFilter .form-check-input:checked").value;
        let cates = document.querySelectorAll("#cateFilter .form-check-input:checked");
        let prices = document.querySelectorAll("#priceFilter .form-check-input:checked");

        for (let i of cates) {
            cateList.push(i.value);
        }
        for (let i of prices) {
            priceList.push(i.value);
        }

        let currentUrl = new URL(window.location.href);
        let searchParams = currentUrl.searchParams;

        searchParams.delete("category");
        searchParams.delete("price");
        searchParams.delete("sort");

        searchParams.set("page", "1");
        searchParams.set("sort", sortValue);

        if (cateList.length > 0) {
            searchParams.set("category", cateList.join(","));
        }
        if (priceList.length > 0) {
            searchParams.set("price", priceList.join(","));
        }

        window.location.href = currentUrl.toString();
    })

    // get params from url and check in form

    let params = new URLSearchParams(window.location.search);
    if (params.has("category")) {
        let cates = params.get("category").split(",");
        let cateFilter = document.querySelectorAll("#cateFilter .form-check-input");
        Array.from(cateFilter).map((item, index) => {
            if (cates.includes(item.value)) {
                item.checked = true;
            }
        })
    }
    if (params.has("price")) {
        let prices = params.get("price").split(",");
        let priceFilter = document.querySelectorAll("#priceFilter .form-check-input");
        Array.from(priceFilter).map((item, index) => {
            if (prices.includes(item.value)) {
                item.checked = true;
            }
        })
    }
    if (params.has("sort")) {
        let sorts = params.get("sort").split(",");
        let sortFilter = document.querySelectorAll("#sortFilter .form-check-input");
        Array.from(sortFilter).map((item, index) => {
            if (sorts.includes(item.value)) {
                item.checked = true;
            }
        })
    }



});
