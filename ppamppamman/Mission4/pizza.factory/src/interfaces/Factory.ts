import * as Recipe from "./Recipe";

interface IPizzaFactory {
  name: string;
  readyIngredient: (specify: string) => void;
  createDough: (dough: Ingredient["dough"]) => Recipe.IDough;
  createSauce: (sauce: Ingredient["sauce"]) => Recipe.ISauce;
  createCheese: (cheese: Ingredient["cheese"]) => Recipe.ICheese;
}

interface Ingredient {
  dough: string;
  sauce: string;
  cheese: string;
}

export default IPizzaFactory;
