import PrinterProxy from "./PrinterProxy.mjs";

class PrinterInterface {
  static #printerProxy = new PrinterProxy();

  static request(document) {
    console.log("프린터 진입");
    console.log(document);
    this.#printerProxy.request(document);
  }

  static getReadyList() {
    console.log("========대기중인 자료========");
  }
}

export default PrinterInterface;
