export interface IPizza {
  dough: IDough["type"] | null;
  sauce: ISauce["type"] | null;
  cheese: ICheese["type"] | null;
}

export interface IDough {
  type: string;
}

export interface ISauce {
  type: string;
}

export interface ICheese {
  type: string;
}
