'use strict';

const e = React.createElement;

class LikeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = { liked: false };
  }

  render() {
    if (this.state.liked) {
      return 'Fighter launched.';
    }

    return e(
      'button',
      { onClick: () => this.launchFighter() },
      'Launch Fighter'
    );
  }

  launchFighter() {
    var xhr = new XMLHttpRequest()
    xhr.open('POST', 'http://localhost:8081/exec.lua')
    xhr.send('PlayerSpaceship():setFaction("Human Navy"):setTemplate("Scapula"):setCallSign("Scapula")')
  }
}



const domContainer = document.querySelector('#launch_button_container');
ReactDOM.render(e(LikeButton), domContainer);
