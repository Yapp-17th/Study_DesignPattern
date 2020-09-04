class Cashier {
  #takedOrder;
  #readyToServe;
  #busy;
  #coffee;
  static #uniqueInstance;
  
  constructor(){    
    this.#takedOrder = false;
    this.#readyToServe = false;
    this.#busy = false;
  }

  static getInstance() {
    if (this.#uniqueInstance === undefined){
      this.#uniqueInstance = new Barista();
    }
    return this.#uniqueInstance;
  }
  
  takeAnOrder(){
    this.#takedOrder = true;
    this.#busy = true;
    return true;
  }
  
  isBusy(){
    return this.#busy;
  }

  completeAnOrder(){
    this.#readyToServe = true;
    return true;
  }

  tossToKitchen(){
    this.#readyToServe = false;
    this.#takedOrder = false;
    this.#busy = false;
    return true;
  }

  receivedFromKitchen(coffee = this.#coffee){
    return coffee;
  }

}

const instanceCashier = Cashier.getInstance();
console.log(instanceCashier);