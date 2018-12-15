import * as React from "react"

import { Solution } from "src/DayX"
import { Stage, Layer, Rect } from "react-konva"

type Point = {
  x: number
  y: number
  xSpeed: number
  ySpeed: number
}

type PointsDensity = {
  density: number
  iteration: number
}

const pointRegex = /position=<([\s-]\d*\.?\d+), ([\s-]\d*\.?\d+)> velocity=<([\s-]\d*\.?\d+), ([\s-]\d*\.?\d+)>/
const toNumber = (s: string) => parseInt(s.trim(), 10)

const calculateDensity = (points: Point[]) => {
  const allX = points.map(p => p.x)
  const allY = points.map(p => p.y)

  const minX = Math.min(...allX)
  const maxX = Math.max(...allX)

  const minY = Math.min(...allY)
  const maxY = Math.max(...allY)

  return maxX - minX + (maxY - minY)
}

const goToIteration = (points: Point[], iteration: number) =>
  points.map(p => ({
    ...p,
    x: p.x + p.xSpeed * iteration,
    y: p.y + p.ySpeed * iteration
  }))

const findLowestDensity = (points: Point[]) => {
  const MAX_ITERATIONS = 20000
  const initialDensity: PointsDensity = {
    density: Number.MAX_VALUE,
    iteration: 0
  }
  const minDensity = Array.from(Array(MAX_ITERATIONS).keys()).reduce<
    PointsDensity
  >((acc, value) => {
    const iteration = value + 1
    const nextIterationPoints = goToIteration(points, iteration)
    const density = calculateDensity(nextIterationPoints)

    return density < acc.density ? { density, iteration } : acc
  }, initialDensity)

  return { ...minDensity, points: goToIteration(points, minDensity.iteration) }
}

const parsePoints = (input: string) => {
  const points: Point[] = input
    .trim()
    .split("\n")
    .map(str => {
      const match = pointRegex.exec(str.trim())
      return match
        ? {
            x: toNumber(match[1]),
            y: toNumber(match[2]),
            xSpeed: toNumber(match[3]),
            ySpeed: toNumber(match[4])
          }
        : null
    })
    .filter(p => p !== null) as Point[]

  return points
}

const normalizePoints = (points: Point[]) =>
  points.map(p => ({ ...p, x: p.x * 3, y: p.y * 3 }))

// -------------------------- Components --------------------------------------

type MessageProps = {
  points: Point[]
}
const Message = (props: MessageProps) => {
  const { density, iteration, points } = findLowestDensity(props.points)
  return (
    <>
      <div>
        Density: {density}, iteration: {iteration}
      </div>
      <Stage width={window.innerWidth} height={window.innerHeight}>
        <Layer>
          {normalizePoints(points).map((point, ind) => (
            <Rect
              key={ind}
              x={point.x}
              y={point.y}
              width={3}
              height={3}
              fill="green"
            />
          ))}
        </Layer>
      </Stage>
    </>
  )
}

const solution = (input: string): Solution => {
  const points = parsePoints(input)

  return {
    part1: <Message points={points} />,
    part2: ""
  }
}

export default solution
