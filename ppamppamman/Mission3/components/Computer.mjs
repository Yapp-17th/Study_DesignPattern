// import PrinterProxy from "./PrinterProxy.mjs";
import { default as Printer } from "./PrinterInterface.mjs";

class Computer {
  requestPrint(document) {
    console.log(Printer);
    Printer.request(document);
  }
}

let c = new Computer();
c.requestPrint("docs1");
c.requestPrint("docs2");
c.requestPrint("docs3");
c.requestPrint("docs4");
