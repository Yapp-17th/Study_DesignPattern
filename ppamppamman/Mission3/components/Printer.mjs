import PrinterProxy from "./PrinterProxy.mjs";

class Printer {
  name;
  #document;
  #isPrinting = false;

  constructor(name) {
    this.name = name;
  }

  isAbleToPrint() {
    return !this.#isPrinting;
  }

  setIsPrinting(flag) {
    this.#isPrinting = flag;
  }

  async print(document) {
    console.log("now printing");
    this.#document = document;
    this.setIsPrinting(true);

    return new Promise(async (resolve) => {
      setTimeout(() => {
        resolve(document);
        this.setIsPrinting(false);
      }, 1000);
    });
  }

  response() {
    this.setIsPrinting(false);
    return `${this.#document} is complete`;
  }
}

export default Printer;
