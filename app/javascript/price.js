window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const itemPrice = parseInt(inputValue);
      const addTaxPrice = Math.floor(itemPrice * 0.1);
      addTaxDom.textContent = addTaxPrice;
      const profit = itemPrice - addTaxPrice;
      profitDom.textContent = profit;
    })
  });