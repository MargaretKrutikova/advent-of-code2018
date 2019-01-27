import { Solution } from "src/DayX"

type Rule = {
  combination: string
  result: string
}

type Iteration = {
  positions: number[]
  state: string
}

const getNextGenPlant = (pots: string, rules: Rule[]) => {
  const match = rules.filter(rule => rule.combination === pots)[0]
  return match ? match.result : "."
}

const runIteration = (iteration: Iteration, rules: Rule[]): Iteration => {
  const { positions, state } = iteration
  const start = positions[0]
  const end = positions[positions.length - 1]
  const extendedPositions = [
    start - 3,
    start - 2,
    start - 1,
    ...positions,
    end + 1,
    end + 2,
    end + 3
  ]

  const extendedState = `.....${state}.....`
  const newState: string[] = []
  for (let i = 2; i < extendedState.length - 2; i++) {
    const pots = extendedState.substr(i - 2, 5)
    newState.push(getNextGenPlant(pots, rules))
  }

  const nextIteration = {
    positions: extendedPositions,
    state: newState.join("")
  }
  console.log(
    newState
      .join("")
      .replace(/^(.)\1+#/, "#")
      .replace(/#(.)\1+$/, "#")
  )

  return nextIteration
}

const solve = (initState: string, rulesStrings: string[][]) => {
  const initPositions = [...Array(initState.length).keys()]
  const rules: Rule[] = rulesStrings.map(rule => ({
    combination: rule[0],
    result: rule[1]
  }))

  let iteration: Iteration = { positions: initPositions, state: initState }
  for (let i = 0; i < 250; i++) {
    iteration = runIteration(iteration, rules)
  }

  return iteration
}

const solution = (): Solution => {
  const initState = // "#..#.#..##......###...###"
    ".##..#.#..##..##..##...#####.#.....#..#..##.###.#.####......#.......#..###.#.#.##.#.#.###...##.###.#"

  const rules = [
    [".##.#", "#"],
    ["##.#.", "#"],
    ["##...", "#"],
    ["#....", "."],
    [".#..#", "."],
    ["#.##.", "."],
    [".##..", "."],
    [".#.##", "."],
    ["###..", "."],
    ["..##.", "#"],
    ["#####", "#"],
    ["#...#", "#"],
    [".#...", "#"],
    ["###.#", "#"],
    ["#.###", "#"],
    ["##..#", "."],
    [".###.", "#"],
    ["...##", "."],
    ["..#.#", "."],
    ["##.##", "#"],
    ["....#", "."],
    ["#.#.#", "#"],
    ["#.#..", "."],
    [".####", "."],
    ["...#.", "#"],
    ["..###", "."],
    ["..#..", "#"],
    [".....", "."],
    ["####.", "."],
    ["#..##", "#"],
    [".#.#.", "."],
    ["#..#.", "#"]
  ]

  solve(initState, rules)

  return {
    part1: "",
    part2: ""
  }
}

export default solution
