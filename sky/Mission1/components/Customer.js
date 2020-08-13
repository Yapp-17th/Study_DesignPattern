export default (function () {
  let instance;
  function init(element) {
    return {
      state: {
        $customer: element,
        isOrder: false,
        isCoffeeOnHand: false,
      },
      setOrder: function () {
        this.state.isOrder = true;
        const pTag = document.createElement("p");
        pTag.textContent = "손님이 주문을 합니다";
        this.state.$customer.appendChild(pTag);
      },
      setCoffeeOnHand: function (i) {
        setTimeout(() => {
          this.state.isCoffeeOnHand = false;
          const pTag = document.createElement("p");
          pTag.textContent = "손님이 커피를 받았어요";
          this.state.$customer.appendChild(pTag);
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
