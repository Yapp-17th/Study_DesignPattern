import { CoffeeType } from "../util/config.js";
import { default as Rx } from "rxjs";

// console.log(CoffeeType.AMERICANO)

class OrderSystem {
  #num = 0;
  static #load;
  static #customer;
  static #cashier;
  static #barista;

  static init() {
    if (this.#load === undefined) {
      this.#load = new Rx.Subject();
      this.#customer = "asdf";
    }

    OrderSystem.on().subscribe((data) => {
      console.log("옵저버");
      console.log(data);
    });
  }

  static on() {
    return this.#load;
  }

  static isOrderedByCustomer(coffee) {
    // console.log(OrderSystem.prototype.isValidOrder);
    if (this.isValidOrder(coffee)) {
      console.log("주문이 접수되었습니다..");
      this.tossToBarista(coffee);
    } else {
      console.log("올바르지 않은 주문입니다.");
      return false;
    }
  }

  static isValidOrder(coffee) {
    if (CoffeeType.hasOwnProperty(coffee)) return true;
    return false;
  }

  static tossToBarista(coffee) {
    console.log(`${coffee} 주문이 접수 되었습니다.`);
    this.#load.next(coffee);
    // return ?
  }
}
console.log(OrderSystem);
// const order = Rx.fromEvent(OrderSystem, "isOrderedByCustomer");
// myBarista.getOrder("coffee1")
// const observer = (event) => {
//   console.log("옵저버");
//   console.log(event);
// };
// order.subscribe(observer);
OrderSystem.init();
OrderSystem.isOrderedByCustomer("AMERICANO");
OrderSystem.isOrderedByCustomer("LATTE");
OrderSystem.isOrderedByCustomer("AMERICANO");

export default OrderSystem;
