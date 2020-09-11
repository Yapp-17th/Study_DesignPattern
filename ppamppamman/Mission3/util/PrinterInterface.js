import PrinterProxy from "./PrinterProxy.js";

class PrinterInterface {
  static #printerProxy = new PrinterProxy();

  static request(document = null) {
    console.log("프린터 진입");
    console.log(document)

    if(document === null){
      this.request.getReadyList = () => {
        this.#printerProxy.request().getReadyList();
      }
    } else {
      console.log("print?")
      this.request.print = () => {
        this.#printerProxy.request(document)?.print();
      }
    }
    return this.request;
  }

}

export default PrinterInterface;
