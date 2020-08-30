export default function Cashier({ isCoffeeOrderIn, setCoffeeOrderIn }) {
  this.isCoffeeOrderIn = isCoffeeOrderIn;
  this.setCoffeeOrderIn = setCoffeeOrderIn;
  this.state = {
    isCoffeeOrderIn,
    stateText: "",
    prevText: "",
  };

  this.setState = ({ isCoffeeOrderIn = false }) => {
    if (this.state.prevText.length === 0 && isCoffeeOrderIn) {
      this.state.isCoffeeOrderIn = isCoffeeOrderIn;
      this.state.prevText = `손님으로부터 주문을 받았습니다`;
      this.state.stateText = `손님으로부터 주문을 받았습니다`;
    } else {
      this.state.stateText = "";
    }
  };
}
