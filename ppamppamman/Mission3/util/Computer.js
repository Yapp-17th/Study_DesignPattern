// import PrinterProxy from "./PrinterProxy.mjs";
import { default as Printer } from "./PrinterInterface.js";
import LogCollector from "./LogCollector.js"

class Computer {
  constructor(){}

  request(document = null){
    if(document === null){
      this.request.getReadyList = () => {
        console.log(this.constructor.name, `request ReadyList`)
        LogCollector.save(this.constructor.name, `request ReadyList`)
        Printer.request().getReadyList();
      }
    }

    if (document !== null) {
      const requestDocument = document
    
      this.request.print = () => {
        console.log("document request", requestDocument)
        LogCollector.save(this.constructor.name, `request ${requestDocument}`)
        Printer.request(requestDocument).print();
      }
    }
    
    return this.request;
  }
  // requestPrint(document) {
    
  //   console.log(Printer);
  //   LogCollector.save(this.constructor.name, `request ${document}`)

  //   Printer.request(document);
  // }

  // requestReadyList(){
  //   LogCollector.save(this.constructor.name, `request ReadyList`)
  //   Printer.requestReadyList();
  // }
}

export default Computer