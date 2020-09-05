class Cashier {
  #name;
  #takedOrder;
  #readyToServe;
  #busy;
  #coffee;

  constructor(name) {
    this.#takedOrder = false;
    this.#readyToServe = true;
    this.#busy = false;
    this.#name = name;
  }

  /* getter */
  get name() {
    return this.#name;
  }

  get isBusy() {
    return this.#busy;
  }

  /* methods */
  takeAnOrder(coffee) {
    if (this.#readyToServe) {
      this.#takedOrder = true;
      this.#busy = true;
    }
    let heldCoffee = coffee;

    this.takeAnOrder.submit = (orderSystem) => {
      console.log(heldCoffee);
      orderSystem.isOrderedByCustomer(coffee);
    }; // 클로저

    return this.takeAnOrder;
  }

  completeAnOrder() {
    this.#readyToServe = true;
    return true;
  }

  tossToKitchen() {
    this.#readyToServe = false;
    this.#takedOrder = false;
    this.#busy = false;
    return true;
  }

  receivedFromKitchen(coffee = this.#coffee) {
    return coffee;
  }
}

export default Cashier;
