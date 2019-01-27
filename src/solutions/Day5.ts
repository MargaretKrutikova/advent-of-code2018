import { Solution } from "src/DayX"

const hasReaction = (left: string, right: string) =>
  (left.toLowerCase() !== left && left.toLowerCase() === right) ||
  (left.toUpperCase() !== left && left.toUpperCase() === right)

const triggerPolymerReaction = (input: string): string => {
  let afterReaction = ""
  let hasReacted = false

  for (let i = 0; i < input.length - 1; i++) {
    if (!hasReaction(input[i], input[i + 1])) {
      afterReaction += input[i]
      if (i === input.length - 2) {
        afterReaction += input[i + 1]
      }
    } else {
      hasReacted = true
      i++
    }
  }

  if (!hasReacted) {
    console.log(afterReaction.length)
    return afterReaction
  }
  return triggerPolymerReaction(afterReaction)
}

const findShortestPolymer = (input: string) => {
  const polymer = triggerPolymerReaction(input)

  const units = new Set([...polymer.toLowerCase()]).values()
  let shortestPolymerLength = Number.MAX_VALUE
  for (const unit of units) {
    const replaceRegex = new RegExp(`[${unit}${unit.toUpperCase()}]`, "g")
    const updatedPolymer = polymer.replace(replaceRegex, "")

    const reactedPolymer = triggerPolymerReaction(updatedPolymer)
    if (reactedPolymer.length < shortestPolymerLength) {
      shortestPolymerLength = reactedPolymer.length
    }
  }

  return shortestPolymerLength
}

// ----------------- ALL ------------------------------------------------

const solution = (input: string): Solution => {
  const sequence = input.replace("\n", "").trim()
  return {
    part1: triggerPolymerReaction(sequence).length,
    part2: findShortestPolymer(sequence)
  }
}

export default solution
