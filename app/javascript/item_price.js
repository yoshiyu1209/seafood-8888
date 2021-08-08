window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
      const commission = (Math.floor(inputValue * 0.1));
  
      addTaxDom.innerHTML = (Math.floor(commission));

      const addGainDom = document.getElementById("profit");
      const gain = (Math.floor(inputValue * 0.1));
      
      addGainDom.innerHTML = (Math.floor(inputValue - gain));
  })
  
});