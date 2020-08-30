export default function Customer({
  isCoffeeChoose,
  isCoffeeOnHand,
  setCoffeeChoose,
  setCoffeeOnHand,
}) {
  this.setCoffeeOnHand = setCoffeeOnHand;
  this.setCoffeeChoose = setCoffeeChoose;
  this.state = {
    isCoffeeChoose,
    isCoffeeOnHand,
    stateText: "",
    prevText: "",
  };

  this.setState = ({ isCoffeeOnHand = false, isCoffeeChoose = false }) => {
    if (this.state.prevText.length === 0 && isCoffeeChoose) {
      this.state.isCoffeeChoose = isCoffeeChoose;
      this.state.prevText = `커피를 선택했습니다`;
      this.state.stateText = `커피를 선택했습니다`;
    } else {
      this.state.stateText = "";
    }

    if (isCoffeeOnHand) {
      this.state.isCoffeeOnHand = isCoffeeOnHand;
      this.state.stateText = `커피를 받았습니다`;
    }
  };
}
