function calc_tax_profit () {
  if(document.getElementById('item-price') != null) {
    const itemPrice = document.getElementById('item-price');
    itemPrice.addEventListener('keyup', () => {
      const tax = Math.floor(itemPrice.value / 10);
      const profit = itemPrice.value - tax;
      const taxArea = document.getElementById('add-tax-price');
      const profitArea = document.getElementById('profit');
      taxArea.innerHTML = tax;
      profitArea.innerHTML = profit;
    });
  }
};

window.addEventListener('load', calc_tax_profit);