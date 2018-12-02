import { Solution } from "src/DayX"

// ----------------- PART 1 ------------------------------------------------

const calculateBoxChecksum = (boxId: string) => {
  const letterMap = [...boxId].reduce<Map<string, number>>(
    (acc, letter) => new Map([...acc, [letter, (acc.get(letter) || 0) + 1]]),
    new Map()
  )

  const values = Array.from(letterMap.values())
  return {
    hasTwo: values.indexOf(2) > -1,
    hasThree: values.indexOf(3) > -1
  }
}

const calculateTotalChecksum = (input: string[]) => {
  const checksums = input.map(calculateBoxChecksum).reduce(
    (acc, checksum) => ({
      twoLetters: acc.twoLetters + (checksum.hasTwo ? 1 : 0),
      threeLetters: acc.threeLetters + (checksum.hasThree ? 1 : 0)
    }),
    { twoLetters: 0, threeLetters: 0 }
  )

  return checksums.threeLetters * checksums.twoLetters
}

// ----------------- PART 2 ------------------------------------------------

const findCommonLetters = (
  leftHead: string | undefined,
  leftTail: string[],
  rightHead: string | undefined,
  rightTail: string[],
  commonLetters: string[]
): string[] => {
  if (leftHead === undefined || rightHead === undefined) {
    return commonLetters
  }

  const [lHead, ...lTail] = leftTail
  const [rHead, ...rTail] = rightTail
  const letters =
    leftHead === rightHead ? commonLetters.concat(leftHead) : commonLetters

  return findCommonLetters(lHead, lTail, rHead, rTail, letters)
}

const compareIdLettersToRest = (
  idToCompare: string | undefined,
  restIds: string[]
): string[] | undefined => {
  if (idToCompare === undefined || restIds.length === 0) {
    return undefined
  }
  const [rightId, ...tailIds] = restIds

  const leftIdLetters = [...idToCompare]
  const rightIdLetters = [...rightId]

  const commonLetters = findCommonLetters(
    leftIdLetters[0],
    leftIdLetters.slice(1),
    rightIdLetters[0],
    rightIdLetters.slice(1),
    []
  )
  if (commonLetters.length === leftIdLetters.length - 1) {
    return commonLetters
  }

  return compareIdLettersToRest(idToCompare, tailIds)
}

const findCorrectIdsCommonLetters = (ids: string[]): string | undefined => {
  if (ids.length === 0) {
    return undefined
  }

  const [head, ...tail] = ids
  const commonLetters = compareIdLettersToRest(head, tail)

  return commonLetters
    ? commonLetters.join("")
    : findCorrectIdsCommonLetters(ids.slice(1))
}

// ------------------------ ALL ------------------------------------------------

const solution = (input: string): Solution => {
  const ids = input.split("\n").map(id => id.trim())

  return {
    part1: calculateTotalChecksum(ids),
    part2: findCorrectIdsCommonLetters(ids)
  }
}

export default solution
