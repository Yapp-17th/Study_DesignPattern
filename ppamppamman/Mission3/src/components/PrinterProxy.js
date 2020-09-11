import Printer from "./Printer.js";

class PrinterProxy {
  #printer = new Printer("빰빰맨의 프린터");
  #queue = [];

  constructor() {}

  request(document = null) {
    if (document != null) {
      this.#queue.push(document);
    }
    if (this.#printer.isAbleToPrint()) {
      let selectedDocument = this.selectDocument();
      console.log("프린트 객체에 프린트 의뢰");

      this.#printer.print(selectedDocument).then(async (res) => {
        await console.log("프린트 완료", res);
        if (this.checkPrintQueue()) {
          console.log("남은 문서 : ", this.#queue);
          this.request();
        }
      });
      // await console.log(response());
    } else {
      console.log(
        this.#printer.name,
        "is busy. your document was send to queue.",
        "남은 문서 : ",
        this.#queue
      );
    }
  }
  checkPrintQueue() {
    if (this.#queue.length != 0) {
      return true;
    } else {
      return false;
    }
  }
  selectDocument() {
    if (this.#queue.length == 0) {
      return null;
    } else {
      return this.#queue.shift();
    }
  }
}

export default PrinterProxy;
