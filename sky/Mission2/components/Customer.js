export default function Customer({
  isCoffeeChoose,
  isCoffeeOnHand,
  setCoffeeChoose,
  setCoffeeOnHand,
}) {
  this.init = () => {
    this.setCoffeeOnHand = setCoffeeOnHand;
    this.setCoffeeChoose = setCoffeeChoose;
    this.state = {
      isCoffeeChoose,
      isCoffeeOnHand,
      stateText: "",
      prevText: "",
    };

    this.$section = document.createElement("section");
    this.$title = document.createElement("h1");
    this.$title.textContent = "Customer";
    this.$section.appendChild(this.$title);
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

  this.init();
}
