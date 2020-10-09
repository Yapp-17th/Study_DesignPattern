import { default as Rx } from "rxjs";

import Cashier from "./components/Cashier.mjs";
import Barista from "./components/Barista.mjs";
// import Coffee from "./components/Coffee.mjs";
import OrderSystem from "./components/OrderSystem.mjs";


const orderSystem = new OrderSystem();
const cashier = new Cashier("빰빰맨");
const myBarista = new Barista();

console.log(`########## cashier ${cashier.name} 출근 ##########`);

console.log("########## cashier orderSystem init start ##########");
orderSystem.initBy(cashier);
console.log("########## cashier orderSystem init end ##########");

console.log(Rx.Observable)
const coffee = Rx.Observable.of("AMERICANO");


cashier.takeAnOrder(coffee).submitTo(orderSystem);

const order = Rx.bindCallback( orderSystem.isOrderedByCustomer );

const observer = () => {
  console.log("asdf");
};

order.call(orderSystem).subscribe(observer);

// OrderSystem.isOrderedByCustomer("AMERICANO");
// OrderSystem.isOrderedByCustomer("LATTE");
// OrderSystem.isOrderedByCustomer("AMERICANO");