import React, { useState } from "react";
import Factory from "../components/Factory";

function View() {
  let [factories, SetFactories] = useState([""]);
  let [factory, SetFactory] = useState("");
  let [count, SetCount] = useState(0);
  const onClickButton1 = (): void => {
    SetFactory("factory_" + String(count));
    SetCount(count + 1);
    // SetFactories(factories.push(factory));
    console.log(count);
  };
  return (
    <>
      <button onClick={onClickButton1}>공장 늘리기</button>
      <br />
      <br />
      <Factory factory={factory}></Factory>
    </>
  );
}

export default View;
