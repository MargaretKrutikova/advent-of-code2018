import * as React from "react"
import inputs from "./inputs"
import solutions from "./solutions"

export type Solution = {
  part1: any
  part2: any
}

type State = {
  solution?: Solution
}

type Props = {
  dayNumber: number
}

class DayX extends React.Component<Props, State> {
  readonly state: State = {}
  solve = async () => {
    const { dayNumber } = this.props
    const inputTextFile = inputs[dayNumber]

    const res = await fetch(inputTextFile)
    const input = await res.text()

    const solutionFn = solutions[dayNumber]
    const solution = solutionFn ? solutionFn(input) : undefined
    this.setState({ solution })
  }
  render() {
    const { dayNumber } = this.props
    const { solution } = this.state

    return (
      <div>
        <button onClick={this.solve}>Solve Day {dayNumber + 1}</button>
        {!solution ? (
          "Not solved yet!"
        ) : (
          <>
            <div>Part 1 - {solution.part1}</div>
            <div>Part 2 - {solution.part2}</div>
          </>
        )}
      </div>
    )
  }
}

export default DayX
