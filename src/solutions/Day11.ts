import { Solution } from "src/DayX"

const calculatePowerLevel = (x: number, y: number, serialNumber: number) => {
  const rackId = x + 10
  const powerLevel = (rackId * y + serialNumber) * rackId
  const powerStr = powerLevel.toString()
  return parseInt(powerStr[powerStr.length - 3], 10) - 5
}

const getMaxPowerLevelArea = (
  serialNumber: number,
  gridSize: number,
  areaSize: number
) => {
  const maxPowerArea = {
    areaSize,
    cell: { x: -1, y: -1 },
    totalPower: -1000
  }
  for (let i = 0; i < gridSize - areaSize; i++) {
    for (let j = 0; j < gridSize - areaSize; j++) {
      let powerLevel = 0
      for (let k = i; k < i + areaSize; k++) {
        for (let m = j; m < j + areaSize; m++) {
          powerLevel += calculatePowerLevel(k + 1, m + 1, serialNumber)
        }
      }
      if (powerLevel > maxPowerArea.totalPower) {
        maxPowerArea.cell = { x: i + 1, y: j + 1 }
        maxPowerArea.totalPower = powerLevel
      }
    }
  }

  return maxPowerArea
}

const solve = (serialNumber: number) => {
  const grid: number[][] = []
  const gridSize = 300

  for (let i = 0; i < gridSize; i++) {
    grid[i] = []
    for (let j = 0; j < gridSize; j++) {
      grid[i][j] = calculatePowerLevel(i + 1, j + 1, serialNumber)
    }
  }

  let maxPowerArea = {
    areaSize: 0,
    cell: { x: -1, y: -1 },
    totalPower: -1000
  }
  for (let c = 1; c <= 20; c++) {
    const areaLevel = getMaxPowerLevelArea(serialNumber, 300, c)
    if (areaLevel.totalPower > maxPowerArea.totalPower) {
      maxPowerArea = areaLevel
    }
  }

  return { part1: maxPowerArea }
}

const solution = (input: string): Solution => {
  const serialNumber = parseInt(input, 10)

  const result = solve(serialNumber)
  console.log(result)
  return {
    part1: result.part1.totalPower,
    part2: ""
  }
}

export default solution
