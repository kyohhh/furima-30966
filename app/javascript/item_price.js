function price (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const itemTax = Math.floor(itemPrice.value / 10);
    const itemProfit = itemPrice.value - itemTax;
    const addTaxPrice  = document.getElementById("add-tax-price");
    const profit  = document.getElementById("profit");
    addTaxPrice.innerHTML = itemTax;
    profit.innerHTML = itemProfit;
  });
}

window.addEventListener('load', price);
