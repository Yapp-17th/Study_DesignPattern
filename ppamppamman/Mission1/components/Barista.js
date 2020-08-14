import Coffee from "./Coffee";
import Cashier from "./Cashier";

class Barista {
  #takedOrder;
  #readyToServe;
  #busy;
  
  #coffee;
  #cashier;

  static #uniqueInstance;
  
  constructor(){    
    this.#takedOrder = false;
    this.#readyToServe = false;
    this.#busy = false;
    this.#coffee = null;
    this.#cashier = null;
  }

  static getInstance() {
    if (this.#uniqueInstance === undefined){
      this.#uniqueInstance = new Barista();
    }
    return this.#uniqueInstance;
  }
  
  takeAnOrder(){
    if (!this.isBusy()) {
      return;
    }
    this.#coffee = null;
    this.#takedOrder = true;
    this.#busy = true;

    this.#cashier = Cashier.getInstance();
    return true;
  }
  
  isBusy(){
    return this.#busy;
  }

  completeAnOrder(){
    this.#readyToServe = true;
    this.#coffee = Coffee.getInstance();
  }

  tossToHall(coffee = this.#coffee){
    this.#readyToServe = false;
    this.#takedOrder = false;
    this.#busy = false;
    
    this.#cashier.receivedFromKitchen(coffee);
    this.#coffee = null;
    
    return true;
  }

  
}

const instanceBarista = Barista.getInstance();
console.log(instance);