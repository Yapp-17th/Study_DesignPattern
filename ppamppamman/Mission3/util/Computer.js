// import PrinterProxy from "./PrinterProxy.mjs";
import { default as Printer } from "./PrinterInterface.js";
import LogCollector from "./LogCollector.js"

class Computer {
  constructor(){}

  requestPrint(document) {
    
    console.log(Printer);
    LogCollector.save(this.constructor.name, `request ${document}`)

    Printer.request(document);
  }

  requestReadyList(){
    LogCollector.save(this.constructor.name, `request ReadyList`)
    Printer.requestReadyList();
  }
}

export default Computer