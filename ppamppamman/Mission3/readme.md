# Mission 3 (프린터 스풀러 구현)
## 개요
- 프록시 패턴의 이해
- [프록시 패턴(Proxy Pattern) by JDM's Blog](https://jdm.kr/blog/235)
- [디자인패턴 - 프록시 패턴 by YABOONG.github.io](https://yaboong.github.io/design-pattern/2018/10/17/proxy-pattern/)
- [Javascript에서의 Proxy Pattern by lesh.log](https://velog.io/@lesh/Javascript%EC%97%90%EC%84%9C%EC%9D%98-Proxy-Pattern%EA%B3%BC-Proxy%EA%B0%9D%EC%B2%B4-3njz2d5vl1)

## 프린터 스풀러 JS
- 프록시 패턴 구현 (가상 프록시)

## 필요 컴포넌트
- Computer (클라이언트)
- PrinterProxy
- Printer
- PrinterInterface (프록시와 실제 객체에 대한 인터페이스)

## 프로세스
```
Computer (only can access PrinterProxy by PrinterInterface)
  -> PrinterInterface 
    -> PrinterProxy (request to Printer)
    -> Printer (return to Computer)
```

## 프린터 스풀러 JS class 정의

### Computer
- requestPrint(document:string) : void

### PrinterInterface
- static printerProxy :Object(PrinterProxy)
- static request(document:string) :void
- static getReadyList() :void

### PrinterProxy
- queue :Object(Array)
- printer :Object(Printer)
- request(document:string) :void
- checkPrintQueue() :boolean
- selectDocument() :string|null

### Printer
- public name :string
- document :string
- isPrinting :boolean
- constructor(name:string) : void
- setIsPrinting(flag:boolean) :void
- isAbleToPrint() :boolean
- print(document:string): Object(Promise)
- response() :string
