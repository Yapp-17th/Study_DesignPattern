export default (function () {
  let instance;
  function init(element) {
    return {
      state: {
        $barrister: element,
        isCoffeeOrderIn: false,
        isCoffeeReady: false,
        isCoffeeTossed: false,
      },
      setOrderIn: function (i) {
        setTimeout(() => {
          this.state.isCoffeeOrderIn = true;
          const pTag = document.createElement("p");
          pTag.textContent = "바리스타가 주문을 확인했어요";
          this.state.$barrister.appendChild(pTag);
        }, 1000 * i);
      },
      setCoffeeReady: function (i) {
        setTimeout(() => {
          this.state.isCoffeeReady = false;
          const pTag = document.createElement("p");
          pTag.textContent = "바리스타가 커피를 만들었어요";
          this.state.$barrister.appendChild(pTag);
        }, 1000 * i);
      },
      setCoffeeTossed: function (i) {
        setTimeout(() => {
          this.state.isCoffeeTossed = false;
          const pTag = document.createElement("p");
          pTag.textContent = "바리스타가 완성된 커피를 캐셔에게 전달해요";
          this.state.$barrister.appendChild(pTag);
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
