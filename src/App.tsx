import * as React from "react";
import "./App.css";

import logo from "./logo.svg";
import text from "./inputs/day1.txt";
import Day1 from "./solutions/Day1";

type State = {
  inputDay1?: string;
};

class App extends React.Component<{}, State> {
  readonly state: State = {};
  solveDay1 = async () => {
    const res = await fetch(text);
    const inputDay1 = await res.text();

    this.setState({ inputDay1 });
  };
  render() {
    const { inputDay1 } = this.state;

    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.tsx</code> and save to reload.
        </p>
        <div>
          <button onClick={this.solveDay1}>Solve Day 1</button>
          <Day1 input={inputDay1} />
        </div>
      </div>
    );
  }
}

export default App;
