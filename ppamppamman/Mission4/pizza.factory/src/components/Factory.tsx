import React, { useEffect } from "react";
import PizzaFactory from "../objects/Factory";

interface IFactoryComponent {
  factory: string | null;
}

function Factory(props: IFactoryComponent) {
  let thisIs: PizzaFactory;
  const { factory } = props;
  useEffect(() => {
    if (factory != null) {
      thisIs = new PizzaFactory(factory);
    }
    console.log(thisIs);
  });
  return <div>팩토리입니다.</div>;
}

export default Factory;
