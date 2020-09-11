import PrinterProxy from "./PrinterProxy.js";
import LogCollector from "./LogCollector.js";

class Printer {
  #name;
  #document;
  #isPrinting = false;

  constructor(name) {
    this.#name = name;
  }

  isAbleToPrint() {
    return !this.#isPrinting;
  }

  setIsPrinting(flag) {
    this.#isPrinting = flag;
  }

  request(document){
    return this.print(document)
  }

  async print(document) {
    console.log("now printing");
    LogCollector.save(this.constructor.name, `===== 문서 인쇄 진입 =====`)
    LogCollector.save(this.constructor.name, `now printing ${document}`)

    this.#document = document;
    this.setIsPrinting(true);

    return new Promise(async (resolve) => {
      setTimeout(() => {
        this.setIsPrinting(false);
        LogCollector.save(this.constructor.name, `프린트 종료 ${document}`)
        setTimeout(() => {
          resolve(document);
        }, 1000);
      }, 2000);
    });
  }

  response() {
    this.setIsPrinting(false);
    return `${this.#document} is complete`;
  }
}

export default Printer;
