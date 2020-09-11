import Printer from "./Printer.js";
import LogCollector from "./LogCollector.js"

class PrinterProxy {
  #printer = new Printer("빰빰맨의 프린터");
  #name;
  #queue = [];

  constructor() {
    this.#name = this.#printer.name;
    // 이제 getName() 등의 요청을 프록시가 대신할 수 있음.
  }

  request(document = null) { // 프록시 패턴의 request
    if (document != null) {
      this.#queue.push(document);
    }
    if (this.#printer.isAbleToPrint()) {
      let selectedDocument = this.selectDocument();
      
      console.log("프린트 객체에 프린트 의뢰");
      LogCollector.save(this.constructor.name, `========프린트 의뢰========`)
      LogCollector.save(this.constructor.name, `의뢰 문서 ${selectedDocument}`)

      this.#printer.request(selectedDocument).then(async (res) => {
        await console.log("프린트 완료", res);
        LogCollector.save(this.constructor.name, `프린트 완료`)
        
        setTimeout(() => {
          if (this.checkPrintQueue()) {
            console.log("남은 문서 : ", this.#queue);
            LogCollector.save("Global", `남은 문서 ${this.#queue}`)
            this.request();
          }  
        },1000)
      });
      // await console.log(response());
    } else {
      console.log(
        this.#printer.name,
        "is busy. your document was send to queue.",
        "남은 문서 : ",
        this.#queue
      );
      LogCollector.save(this.constructor.name, `프린터는 일하는 중... 의뢰 불가 문서 대기열 ${this.#queue}`)
    }
  }

  requestReadyList() {
    console.log("========대기중인 자료========");
    console.log(this.#queue);
    LogCollector.save(this.constructor.name, `========대기중인 자료========`)
    console.log(this.#queue)
    this.#queue.length === 0
      ? LogCollector.save(this.constructor.name, "비어있습니다.")
      : LogCollector.save(this.constructor.name, this.#queue)
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
