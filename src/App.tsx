import * as React from "react"
import DayX from "./DayX"
import "./App.css"

const App: React.SFC<{}> = () => (
  <div className="App">
    <header className="App-header">
      <h1 className="App-title">Welcome to React</h1>
    </header>
    <p className="App-intro">
      To get started, edit <code>src/App.tsx</code> and save to reload.
    </p>
    <div>
      {Array.from(Array(25).keys()).map(day => (
        <DayX dayNumber={day} key={day} />
      ))}
    </div>
  </div>
)

export default App
