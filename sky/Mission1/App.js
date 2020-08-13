import Customer from "./components/Customer.js";
import Cashier from "./components/Cashier.js";
import Barrister from "./components/Barrister.js";

export default (function () {
  let instance;
  const cafe = document.getElementById("cafe");
  function init() {
    return (function () {
      let customer = Customer.getInstance(cafe);
      let cashier = Cashier.getInstance(cafe);
      let barrister = Barrister.getInstance(cafe);

      for (let i = 0; i < 9; i++) {
        if (i === 0) {
          customer.setOrder(i);
        } else if (i === 1) {
          cashier.setOrderIn(i);
        } else if (i === 2) {
          cashier.setCoffeeOrderTossed(i);
        } else if (i === 3) {
          barrister.setOrderIn(i);
        } else if (i === 4) {
          barrister.setCoffeeReady(i);
        } else if (i === 5) {
          barrister.setCoffeeTossed(i);
        } else if (i === 6) {
          cashier.setCoffeeOnHand(i);
        } else if (i === 7) {
          cashier.setCoffeeTossed(i);
        } else {
          customer.setCoffeeOnHand(i);
        }
      }
    })();
  }
  return {
    getInstance: function () {
      if (!instance) {
        instance = init();
      }
      return instance;
    },
  };
})();
