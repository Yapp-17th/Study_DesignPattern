import Cashier from "./Cashier.js";
import Barrister from "./Barrister.js";
import Customer from "./Customer.js";

export default function App(elementId) {
  this.$app = document.getElementById(elementId);

  this.init = () => {
    this.state = {
      isCoffeeChoose: false,
      isCoffeeOrderIn: false,
      isCoffeeReady: false,
      isCoffeeOnHand: false,
      observersTable: [],
      countNum: 0,
    };

    this.state.observersTable = [
      new Customer({
        isCoffeeChoose: this.state.isCoffeeChoose,
        isCoffeeOnHand: this.state.isCoffeeOnHand,
        setCoffeeChoose: this.setCoffeeChoose.bind(this),
        setCoffeeOnHand: this.setCoffeeOnHand.bind(this),
      }),
      new Cashier({
        isCoffeeOrderIn: this.state.isCoffeeOrderIn,
        setCoffeeOrderIn: this.setCoffeeOrderIn.bind(this),
      }),
      new Barrister({
        isCoffeeReady: this.state.isCoffeeReady,
        setCoffeeReady: this.setCoffeeOrderIn.bind(this),
      }),
    ];

    this.setCoffeeChoose(true, ++this.state.countNum);
  };

  this.displayState = (observer) => {
    observer.setState(this.state);
    const pTag = document.createElement("p");
    pTag.textContent = observer.state.stateText;
    this.$app.appendChild(pTag);
  };

  this.setCoffeeChoose = (isCoffeeChoose, number) => {
    this.state.isCoffeeChoose = isCoffeeChoose;
    this.notifyObserver();
    setTimeout(() => {
      this.state.countNum++;
      this.setCoffeeOrderIn(true, this.state.countNum);
    }, 1000 * number);
  };

  this.setCoffeeOrderIn = (isCoffeeOrderIn, number) => {
    this.state.isCoffeeOrderIn = isCoffeeOrderIn;
    this.notifyObserver();
    setTimeout(() => {
      this.state.countNum++;
      this.setCoffeeReady(true, this.state.countNum);
    }, 1000 * number);
  };

  this.setCoffeeReady = (isCoffeeReady, number) => {
    this.state.isCoffeeReady = isCoffeeReady;
    this.notifyObserver();
    setTimeout(() => {
      this.state.countNum++;
      this.setCoffeeOnHand(true);
    }, 1000 * number);
  };

  this.setCoffeeOnHand = (isCoffeeOnHand) => {
    this.state.isCoffeeOnHand = isCoffeeOnHand;
    this.notifyObserver();
  };

  this.notifyObserver = () => {
    this.state.observersTable.forEach((observer, idx) =>
      this.displayState(observer)
    );
  };

  this.init();
}
