import { Solution } from "src/DayX"

type Claim = {
  id: string
  rectangle: Rectangle
}

type Rectangle = {
  top: number
  left: number
} & Size

type Size = {
  width: number
  height: number
}

type Overlap = {
  ids: string[]
  count: number
}

// ----------------- PART 1 & 2 ------------------------------------------------

const fillInRectangleOverlaps = (
  claimId: string,
  rectangle: Rectangle,
  overlaps: Map<string, Overlap>
): Map<string, Overlap> => {
  const xStart = rectangle.left - 1
  const yStart = rectangle.top - 1

  const yCoords = Array.from(Array(rectangle.height).keys()).map(
    y => y + yStart
  )

  return Array.from(Array(rectangle.width).keys())
    .map(x => x + xStart)
    .reduce<Map<string, Overlap>>(
      (xAcc, xCoord) =>
        yCoords.reduce<Map<string, Overlap>>((yAcc, yCoord) => {
          const key = `${xCoord},${yCoord}`
          const overlap = yAcc.get(key) || { count: 0, ids: [] }

          yAcc.set(key, {
            count: overlap.count + 1,
            ids: [...overlap.ids, claimId]
          })
          return yAcc
        }, xAcc),
      overlaps
    )
}

const fillInClaimOverlaps = (
  claims: Claim[],
  overlaps: Map<string, Overlap>
): Map<string, Overlap> => {
  if (claims.length === 0) {
    return overlaps
  }
  const [head, ...rest] = claims

  const combinedOverlaps = fillInRectangleOverlaps(
    head.id,
    head.rectangle,
    overlaps
  )

  return fillInClaimOverlaps(rest, combinedOverlaps)
}

const solveRecursion = (claims: Claim[]) => {
  const overlaps = fillInClaimOverlaps(claims, new Map())
  const overlapValues = Array.from(overlaps.values()).filter(
    overlap => overlap.count > 1
  )

  const overlappingInches = overlapValues.length

  const overlappingIds = new Set<string>()
  for (const value of overlapValues) {
    value.ids.forEach(id => {
      overlappingIds.add(id)
    })
  }

  const claimsWithoutOverlap = claims
    .map(claim => claim.id)
    .filter(id => !overlappingIds.has(id))

  return { overlappingInches, claimsWithoutOverlap }
}

// const solve = (claims: Claim[]) => {
//   const fabric: Overlap[][] = []

//   for (const { rectangle, id } of claims) {
//     const xStart = rectangle.left - 1
//     const xEnd = xStart + rectangle.width

//     const yStart = rectangle.top - 1
//     const yEnd = yStart + rectangle.height

//     for (let y = yStart; y < yEnd; y++) {
//       if (!fabric[y]) {
//         fabric[y] = []
//       }
//       for (let x = xStart; x < xEnd; x++) {
//         const overlap = fabric[y][x] || { count: 0, ids: [] }

//         fabric[y][x] = { count: overlap.count + 1, ids: [...overlap.ids, id] }
//       }
//     }
//   }

//   let overlappingInches = 0
//   const overlappingIds = new Set<string>()
//   for (let i = 0; i <= fabric.length; i++) {
//     if (fabric[i]) {
//       for (let j = 0; j <= fabric[i].length; j++) {
//         if (fabric[i][j] !== undefined && fabric[i][j].count > 1) {
//           overlappingInches++

//           fabric[i][j].ids.forEach(id => {
//             overlappingIds.add(id)
//           })
//         }
//       }
//     }
//   }

//   const claimsWithoutOverlap = claims
//     .map(claim => claim.id)
//     .filter(id => !overlappingIds.has(id))

//   return { overlappingInches, claimsWithoutOverlap }
// }

// ------------------------ ALL --------------------------------------------

// Part 1 - 100595
// Part 2 - #415

const solution = (input: string): Solution => {
  const claims: Claim[] = input
    .split("\n")
    .filter(id => !!id)
    .map(id => {
      const parts = id.split("@").map(part => part.trim())

      const rect = parts[1].split(":").map(part => part.trim())
      const coords = rect[0].split(",").map(coord => parseInt(coord, 10))
      const size = rect[1].split("x").map(dimension => parseInt(dimension, 10))

      return {
        id: parts[0],
        rectangle: {
          left: coords[0],
          top: coords[1],
          width: size[0],
          height: size[1]
        }
      }
    })

  const result = solveRecursion(claims)
  return { part1: result.overlappingInches, part2: result.claimsWithoutOverlap }
}

export default solution
