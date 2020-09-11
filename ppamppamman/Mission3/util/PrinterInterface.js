import PrinterProxy from "./PrinterProxy.js";

class PrinterInterface {
  static #printerProxy = new PrinterProxy();

  static request(document) {
    if(document == undefined){
      return;
    }
    console.log("프린터 진입");
    console.log(document);
    this.#printerProxy.request(document);

    function readyList() {
      this.#printerProxy.requestReadyList();
    }
  }

}

export default PrinterInterface;
