// import PrinterProxy from "./PrinterProxy.mjs";
import { default as Printer } from "./PrinterInterface.js";
import LogCollector from "./LogCollector.js"

class Computer {
  constructor(){}

  request(document){
    const requestDocument = document
    console.log("document request", requestDocument)
    
    function print() {
      console.log("document request", requestDocument)
      console.log(Printer);
      LogCollector.save(this.constructor.name, `request ${requestDocument}`)
      Printer.request(requestDocument);
    }

    function readyList() {

    }
    console.log(this.request)
    return this.request.bind(this);
  }
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