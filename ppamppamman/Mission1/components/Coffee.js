class Coffee {
  #occupants;
  static #uniqueInstance;

  constructor(){    
    this.#occupants = []; // 마시는 사람들이 들어갈 것
  }

  static getInstance() {
    if (this.#uniqueInstance === undefined){
      this.#uniqueInstance = new Coffee();
    }
    return this.#uniqueInstance;
  }
  
  isServedTo(customer){
    this.#occupants.push(customer);
    return true;
  }
}

const instanceCoffee = Coffee.getInstance();
console.log(instanceCoffee);