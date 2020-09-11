import PrinterProxy from "./PrinterProxy.js";

class PrinterInterface {
  static #printerProxy = new PrinterProxy();

  static request(document) {
    console.log("프린터 진입");
    console.log(document);
    this.#printerProxy.request(document);
  }

  static requestReadyList(){
    this.#printerProxy.requestReadyList();
  }

}

export default PrinterInterface;
