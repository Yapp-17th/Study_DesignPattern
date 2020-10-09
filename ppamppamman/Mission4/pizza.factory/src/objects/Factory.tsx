import IPizzaFactory from "../interfaces/Factory";
import * as Recipe from "../interfaces/Recipe";

class PizzaFactory implements IPizzaFactory {
  name: string = "sample";
  ingredients: Recipe.IPizza = { dough: null, sauce: null, cheese: null };

  constructor(name: string) {
    this.name = name;
  }

  readyIngredient(specify: string) {
    switch (specify) {
      case "dough":
        this.createDough(specify);
        break;
      case "cheese":
        this.createCheese(specify);
        break;
      case "sauce":
        this.createSauce(specify);
        break;
      default:
        break;
    }
  }

  createDough(dough: string): Recipe.IDough {
    this.ingredients["dough"] = dough;
    return { type: this.ingredients["dough"] };
  }

  createCheese(cheese: string): Recipe.ICheese {
    this.ingredients["cheese"] = cheese;
    return { type: this.ingredients["cheese"] };
  }

  createSauce(sauce: string): Recipe.ISauce {
    this.ingredients["sauce"] = sauce;
    return { type: this.ingredients["sauce"] };
  }
}

export default PizzaFactory;
