import { Solution } from "src/DayX"

type MetaPosition = {
  nextPosition: number
  metaDataSum: number
  nodes: Node[]
}

type Node = {
  metaData: number[]
  children: Node[]
}

const getMetaData = (array: number[], from: number, count: number) =>
  array.slice(from, from + count)

const getSum = (array: number[]) =>
  array.reduce<number>((acc, val) => acc + val, 0)

// ------------------------------ part 1

const sumMetadata = (
  subTree: number[],
  currentPosition: number
): MetaPosition => {
  const numberOfChildren = subTree[currentPosition]
  const numberOfMetadata = subTree[currentPosition + 1]

  const startPos = currentPosition + 2
  if (numberOfChildren === 0) {
    const metaData = getMetaData(subTree, startPos, numberOfMetadata)

    return {
      nodes: [{ metaData, children: [] }],
      nextPosition: startPos + numberOfMetadata,
      metaDataSum: getSum(metaData)
    }
  }

  const {
    metaDataSum: childrenMetaSum,
    nextPosition: childrenEndPos,
    nodes: childNodes
  } = Array.from(Array(numberOfChildren).keys()).reduce<MetaPosition>(
    acc => {
      const { nextPosition, metaDataSum, nodes } = sumMetadata(
        subTree,
        acc.nextPosition
      )
      return {
        nextPosition,
        metaDataSum: acc.metaDataSum + metaDataSum,
        nodes: acc.nodes.concat(nodes)
      }
    },
    { nextPosition: startPos, metaDataSum: 0, nodes: [] }
  )

  const ownMetaData = getMetaData(subTree, childrenEndPos, numberOfMetadata)
  const ownMetaSum = getSum(ownMetaData)

  return {
    nodes: [{ metaData: ownMetaData, children: childNodes }],
    metaDataSum: childrenMetaSum + ownMetaSum,
    nextPosition: childrenEndPos + numberOfMetadata
  }
}

// ------------------------------ part 2

const findNodeValue = (node: Node): number => {
  if (!node.children || node.children.length === 0) {
    return getSum(node.metaData)
  }

  return node.metaData
    .map(md => node.children[md - 1])
    .filter(child => !!child)
    .reduce<number>((acc, child) => acc + findNodeValue(child!), 0)
}

const solve = (license: string) => {
  const licenseNumbers = license.split(" ").map(l => parseInt(l, 10))
  const part1 = sumMetadata(licenseNumbers, 0)
  const part2 = findNodeValue(part1.nodes[0])

  console.log(part2)
  return { part2, part1: part1.metaDataSum }
}

const solution = (input: string): Solution => {
  const licence = input.trim()

  const result = solve(licence)

  return {
    part1: result.part1, // 42768
    part2: result.part2 // 34348
  }
}

export default solution
