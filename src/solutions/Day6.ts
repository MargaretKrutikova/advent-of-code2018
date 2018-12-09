import { Solution } from "src/DayX"

type Point = {
  x: number
  y: number
}

type DistanceFromPoint = {
  point: Point
  distance: number
  isShared?: boolean
}

const calculateDistance = (a: Point, b: Point) =>
  Math.abs(a.x - b.x) + Math.abs(a.y - b.y)

const isInfiniteArea = (
  area: Point[],
  gridLength: number,
  gridHeight: number
) =>
  area.some(
    point =>
      point.x === 0 ||
      point.x === gridLength ||
      point.y === 0 ||
      point.y === gridHeight
  )

const solve = (points: Point[]) => {
  const pointAreaMap = new Map<Point, Point[]>()
  const length = Math.max(...points.map(p => p.x))
  const height = Math.max(...points.map(p => p.y))

  for (let x = 0; x <= length; x++) {
    for (let y = 0; y <= height; y++) {
      const closestDistance = points.reduce<DistanceFromPoint>(
        (acc, point) => {
          const distance = calculateDistance(point, { x, y })
          if (distance === acc.distance) {
            return { distance, isShared: true, point }
          }
          return distance < acc.distance ? { distance, point } : acc
        },
        { distance: Number.MAX_VALUE, point: { x: -1, y: -1 } }
      )

      if (!closestDistance.isShared) {
        const pointArea = pointAreaMap.get(closestDistance.point) || []
        pointAreaMap.set(closestDistance.point, [...pointArea, { x, y }])
      }
    }
  }

  let biggestArea = 0
  for (const pointArea of pointAreaMap) {
    const area = pointArea[1]

    if (!isInfiniteArea(area, length, height) && area.length > biggestArea) {
      biggestArea = area.length
    }
  }

  // -------------- part 2 -----------------------------
  const maxDistance = 10000
  let largestSafeRegion = 0

  for (let x = 0; x <= length; x++) {
    for (let y = 0; y <= height; y++) {
      const distanceToAllPoints = points.reduce<number>(
        (acc, point) => acc + calculateDistance(point, { x, y }),
        0
      )
      if (distanceToAllPoints < maxDistance) {
        largestSafeRegion++
      }
    }
  }

  return { part1: biggestArea, part2: largestSafeRegion }
}

const solution = (input: string): Solution => {
  const points: Point[] = input
    .split("\n")
    .filter(point => !!point)
    .map(point => {
      const coords = point
        .trim()
        .split(", ")
        .map(coord => parseInt(coord.trim(), 10))
      return { x: coords[0], y: coords[1] }
    })

  const result = solve(points)

  return {
    part1: result.part1,
    part2: result.part2
  }
}

export default solution
