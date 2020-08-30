export default function Barrister({ isCoffeeReady, setCoffeeReady }) {
  this.isCoffeeReady = isCoffeeReady;
  this.setCoffeeReady = setCoffeeReady;
  this.state = {
    isCoffeeReady,
    stateText: "",
    prevText: "",
  };

  this.setState = ({ isCoffeeReady = false }) => {
    if (this.state.prevText.length === 0 && isCoffeeReady) {
      this.state.isCoffeeReady = isCoffeeReady;
      this.state.prevText = `커피를 완성하였습니다`;
      this.state.stateText = `커피를 완성하였습니다`;
    } else {
      this.state.stateText = "";
    }
  };
}
