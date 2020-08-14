export default (function () {
  let instance;
  function init(element) {
    return {
      state: {
        $cashier: element,
        isCoffeeOrderIn: false,
        isCoffeeOrderTossed: false,
        isCoffeeOnHand: false,
        isCoffeeTossed: false,
      },
      setOrderIn: function (i) {
        setTimeout(() => {
          this.state.isCoffeeOrderIn = true;
          const pTag = document.createElement("p");
          pTag.textContent = "캐셔가 커피주문을 받았어요";
          this.state.$cashier.appendChild(pTag);
        }, 1000 * i);
      },
      setCoffeeOrderTossed: function (i) {
        setTimeout(() => {
          this.state.isCoffeeOrderTossed = true;
          const pTag = document.createElement("p");
          pTag.textContent = "캐셔가 주문을 바리스타에게 건네줘요";
          this.state.$cashier.appendChild(pTag);
        }, 1000 * i);
      },
      setCoffeeOnHand: function (i) {
        setTimeout(() => {
          this.state.isCoffeeOnHand = true;
          const pTag = document.createElement("p");
          pTag.textContent = "캐셔가 바리스타로부터 커피를 받았어요";
          this.state.$cashier.appendChild(pTag);
        }, 1000 * i);
      },
      setCoffeeTossed: function (i) {
        setTimeout(() => {
          this.state.isCoffeeTossed = true;
          const pTag = document.createElement("p");
          pTag.textContent = "캐셔가 손님에게 커피를 건네줘요";
          this.state.$cashier.appendChild(pTag);
        }, 1000 * i);
      },
    };
  }
  return {
    getInstance: function (element) {
      if (!instance) {
        instance = init(element);
      }
      return instance;
    },
  };
})();
