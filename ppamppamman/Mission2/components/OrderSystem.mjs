import { CoffeeType } from '../util/config.js'
import { default as Rx } from 'rxjs';

// console.log(CoffeeType.AMERICANO)


class OrderSystem {
  #num = 0;
  #customer;
  #cashier;
  #barista;

  constructor(){
    // this.#num = this.#num + 1;
    // this.#customer
  }
  static isOrderedByCustomer(coffee){
    console.log(OrderSystem.prototype.isValidOrder)
    if(!(new OrderSystem().isValidOrder(coffee))){
      console.log("올바르지 않은 주문입니다.");
      return false;
    } else {
      console.log("주문이 접수되었습니다..");
      new OrderSystem().tossToBarista(coffee);
    }
  }

  isValidOrder(coffee){
    if (CoffeeType.hasOwnProperty(coffee))
      return true;
    return false;
  }
  
  tossToBarista(coffee){
    console.log("접수 되었습니다.")
    console.log(coffee)
    
    return Rx.of(coffee);
    
  }
}

OrderSystem.isOrderedByCustomer("AMERICANO")
export default OrderSystem;