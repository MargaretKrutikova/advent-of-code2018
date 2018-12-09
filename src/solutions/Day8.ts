import { Solution } from "src/DayX"

type MetaPosition = {
  nextPosition: number
  metaDataSum: number
}

const getSumFromCount = (array: number[], from: number, count: number) =>
  array.slice(from, from + count).reduce<number>((acc, val) => acc + val, 0)

const sumMetadata = (
  subTree: number[],
  currentPosition: number
): MetaPosition => {
  const numberOfChildren = subTree[currentPosition]
  const numberOfMetadata = subTree[currentPosition + 1]

  const startPos = currentPosition + 2
  if (numberOfChildren === 0) {
    return {
      nextPosition: startPos + numberOfMetadata,
      metaDataSum: getSumFromCount(subTree, startPos, numberOfMetadata)
    }
  }

  const {
    metaDataSum: childrenMetaSum,
    nextPosition: childrenEndPos
  } = Array.from(Array(numberOfChildren).keys()).reduce<MetaPosition>(
    acc => {
      const { nextPosition, metaDataSum } = sumMetadata(
        subTree,
        acc.nextPosition
      )
      return { nextPosition, metaDataSum: acc.metaDataSum + metaDataSum }
    },
    { nextPosition: startPos, metaDataSum: 0 }
  )

  const ownMetaSum = getSumFromCount(subTree, childrenEndPos, numberOfMetadata)

  return {
    metaDataSum: childrenMetaSum + ownMetaSum,
    nextPosition: childrenEndPos + numberOfMetadata
  }
}

const solve = (license: string) => {
  const licenseNumbers = license.split(" ").map(l => parseInt(l, 10))
  const part1 = sumMetadata(licenseNumbers, 0).metaDataSum

  return { part1, part2: "" }
}

const solution = (input: string): Solution => {
  const licence = input.trim()

  const result = solve(licence)

  return {
    part1: result.part1, // 42768
    part2: result.part2
  }
}

export default solution
