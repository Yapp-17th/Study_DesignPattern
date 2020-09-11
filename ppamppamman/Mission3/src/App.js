import React from 'react';

import Printer from "../util/Printer.js";
import Computer from "../util/Computer.js";
import PrinterProxy from "../util/PrinterProxy.js";

import MainView from "./views/MainView.js";

const App = () => {
  
  const computer = new Computer();

  return (
    <MainView computer={computer}/>
  )
}

export default App;