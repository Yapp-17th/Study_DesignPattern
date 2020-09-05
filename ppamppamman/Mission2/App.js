import Cashier from "./components/Cashier.mjs";
// import Barista from "./components/Barista.mjs";
// import Coffee from "./components/Coffee.mjs";
import OrderSystem from "./components/OrderSystem.mjs";

const orderSystem = new OrderSystem();
const cashier = new Cashier("빰빰맨");

console.log(`########## cashier ${cashier.name} 출근 ##########`);

console.log("########## cashier orderSystem init start ##########");
orderSystem.initBy(cashier);
console.log("########## cashier orderSystem init end ##########");

const coffee = "AMERICANO";
cashier.takeAnOrder(coffee).submit(orderSystem);

// OrderSystem.isOrderedByCustomer("AMERICANO");
// OrderSystem.isOrderedByCustomer("LATTE");
// OrderSystem.isOrderedByCustomer("AMERICANO");
