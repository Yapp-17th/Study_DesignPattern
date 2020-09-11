import PrinterProxy from "./PrinterProxy.js";
import LogCollector from "./LogCollector.js";

class Printer {
  #name;
  #document;
  #isPrinting = false;

  constructor(name) {
    this.#name = name;
  }

  request(document){

    this.request.print = () => {

      console.log("now printing");
      LogCollector.save(this.constructor.name, `===== 문서 인쇄 진입 =====`)
      LogCollector.save(this.constructor.name, `now printing ${document}`)

      this.#document = document ;
      this.setIsPrinting(true);

      return new Promise(async (resolve) => {
        setTimeout(() => {
          LogCollector.save(this.constructor.name, `프린트 종료 ${document}`)
          setTimeout(() => {
            this.setIsPrinting(false);
            resolve(document);
          }, 1000);
        }, 2000);
      });

    }

    return this.request
  }

  isAbleToPrint() {
    return !this.#isPrinting;
  }

  setIsPrinting(flag) {
    this.#isPrinting = flag;
  }

}

export default Printer;
