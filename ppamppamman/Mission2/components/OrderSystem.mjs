import { CoffeeType } from "../util/config.js";
import { default as Rx } from "rxjs";

class OrderSystem {
  #load;
  #orders = [];
  #cashier;
  #barista;
  #isInited = false;

  constructor() {
    if (this.#load === undefined) {
      this.#load = new Rx.Subject();
    }
  }

  get isInited() {
    return this.#isInited;
  } // getter

  initBy(cashier) {
    if (!this.isInited) {
    }
    this.#cashier = cashier;
    console.log(`오더시스템이 ${this.#cashier.name}에 의해 시작됨`);
  }

  get on() {
    return this.#load;
  }

  isOrderedByCustomer(coffee) {
    // console.log(OrderSystem.prototype.isValidOrder);
    if (this.isValidOrder(coffee)) {
      console.log("주문이 접수되었습니다..");
      this.tossToBarista(coffee);
    } else {
      console.log("올바르지 않은 주문입니다.");
      return false;
    }
  }

  isValidOrder(coffee) {
    if (CoffeeType.hasOwnProperty(coffee)) return true;
    return false;
  }

  tossToBarista(coffee) {
    console.log(`${coffee} 주문이 접수 되었습니다.`);
    this.#load.next(coffee);
    // return ?
  }
}
// const order = Rx.fromEvent(OrderSystem, "isOrderedByCustomer");
// myBarista.getOrder("coffee1")
// const observer = (event) => {
//   console.log("옵저버");
//   console.log(event);
// };
// order.subscribe(observer);

export default OrderSystem;
