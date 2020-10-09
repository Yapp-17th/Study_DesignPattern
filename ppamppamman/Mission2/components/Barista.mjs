import { default as Rx } from "rxjs";

// import Coffee from "./Coffee";
// import Cashier from "./Cashier";
import OrderSystem from "./OrderSystem.mjs";

export default class Barista {
  #takedOrder;
  #readyToServe;
  #busy;

  #coffee;
  #cashier;

  constructor() {
    this.#takedOrder = false;
    this.#readyToServe = false;
    this.#busy = false;
    this.#coffee = null;
    this.#cashier = null;
    this.init();
  }

  init() {
    // this.on().subscribe((data) => {
    //   console.log("옵저버");
    //   console.log(data);
    // });
  }

  takeAnOrder(coffee) {
    if (this.isBusy()) {
      return;
    }
    console.log("take", coffee);
    this.#coffee = coffee;
    this.#takedOrder = true;
    this.#busy = true;

    return true;
  }

  isBusy() {
    return this.#busy;
  }

  completeAnOrder() {
    this.#readyToServe = true;
    // this.#coffee = Coffee.getInstance();
  }

  tossToHall(coffee = this.#coffee) {
    this.#readyToServe = false;
    this.#takedOrder = false;
    this.#busy = false;

    this.#cashier.receivedFromKitchen(coffee);
    this.#coffee = null;

    return true;
  }
}
