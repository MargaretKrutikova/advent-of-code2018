import { Solution } from "src/DayX"

// ----------------- PART 1 ------------------------------------------------

const calcFrequency = (frequencyChanges: number[]) =>
  frequencyChanges.reduce((acc, change) => acc + change, 0)

// ----------------- PART 2 ------------------------------------------------

type FrequencyState = {
  currentFrequency: number
  frequencesSeen: Set<number>
  frequencySeenTwice?: number
}

const findFirstFrequencySeenTwice = (frequencyChanges: number[]) => {
  const initialState: FrequencyState = {
    currentFrequency: 0,
    frequencesSeen: new Set()
  }

  return applyChangesUntilFirstFrequencySeenTwice(
    initialState,
    frequencyChanges
  )
}

const applyChangeToFrequencyState = (
  state: FrequencyState,
  frequencyChange: number
): FrequencyState => {
  const { currentFrequency, frequencesSeen, frequencySeenTwice } = state
  if (frequencySeenTwice) {
    return state
  }

  const newFrequency = currentFrequency + frequencyChange
  if (frequencesSeen.has(newFrequency)) {
    return { ...state, frequencySeenTwice: newFrequency }
  }

  frequencesSeen.add(newFrequency)
  return {
    frequencesSeen,
    currentFrequency: newFrequency
  }
}

const applyChangesUntilFirstFrequencySeenTwice = (
  frequencyState: FrequencyState,
  frequencyChanges: number[]
): number => {
  const newState = frequencyChanges.reduce<FrequencyState>(
    applyChangeToFrequencyState,
    frequencyState
  )

  if (newState.frequencySeenTwice) {
    return newState.frequencySeenTwice
  }

  return newState.frequencySeenTwice
    ? newState.frequencySeenTwice
    : applyChangesUntilFirstFrequencySeenTwice(newState, frequencyChanges)
}

// ----------------- ALL ------------------------------------------------

const solution = (input: string): Solution => {
  const frequencyChanges = input
    .split("\n")
    .filter(change => !!change)
    .map(change => parseInt(change.trim(), 10))

  return {
    part1: calcFrequency(frequencyChanges), // 400
    part2: findFirstFrequencySeenTwice(frequencyChanges) // 232
  }
}

export default solution
