window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.10).toLocaleString('ja-JP');
    const priceContentDom = document.getElementById("profit");
    priceContentDom.innerHTML = Math.floor(inputValue * 0.90).toLocaleString('ja-JP');
  })
});

