class LogCollector {

  static save(object, msg){
    switch(object){
      case "Computer":
        document.querySelector("div#computerLog").innerHTML += msg + '<br />'
        break;
      case "PrinterProxy":
        document.querySelector("div#printerProxyLog").innerHTML += msg + '<br />'
        break;
      case "Printer":
        document.querySelector("div#printerLog").innerHTML += msg + '<br />'
        break;
      case "Global":
        document.querySelector("div#globalLog").innerHTML += msg + '<br />'
      default:
        break;
    }
  }
} 

export default LogCollector
