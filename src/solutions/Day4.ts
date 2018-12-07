import { Solution } from "src/DayX"

enum GuardState {
  Awake,
  Asleep
}

type Shift = {
  dateTime: Date
  guardId?: number
  state?: GuardState
}

type Interval = {
  start: number
  end: number
}

type DayShiftIntervals = {
  intervals: Interval[]
}

type DayShift = {
  shifts: Shift[]
}

type GuardMinute = {
  id: number
  minute: number
  timeAsleep: number
}

// ---------------------------- Helpers ----------------------------------------

const extractDateRegex = /\[(.*?)\]/i
const extractGuardIdRegex = /#(.*?)\s/i

const getGuardStateFromRecord = (record: string): GuardState | undefined =>
  record.indexOf("wakes up") > -1
    ? GuardState.Awake
    : record.indexOf("falls asleep") > -1
    ? GuardState.Asleep
    : undefined

const parseRecord = (record: string): Shift => {
  const dateMatch = extractDateRegex.exec(record)
  if (!dateMatch) {
    return { dateTime: new Date() }
  }

  const dateTime = new Date(dateMatch[1])
  const guardRecord = record.replace(dateMatch[0], "").trim()

  const guardIdMatch = extractGuardIdRegex.exec(guardRecord)
  const guardId = guardIdMatch ? parseInt(guardIdMatch[1], 10) : undefined

  const state = guardId
    ? GuardState.Awake
    : getGuardStateFromRecord(guardRecord)

  return { dateTime, guardId, state }
}

const sortShifts = (shifts: Shift[] = []) =>
  shifts.sort((a, b) => (a.dateTime.getTime() > b.dateTime.getTime() ? 1 : -1))

const extractGuardShift = (
  guardShift: DayShift,
  shifts: Shift[]
): { guardShift: DayShift; shifts: Shift[] } => {
  const [head, ...tail] = shifts
  if (!!head && head.guardId === undefined) {
    return extractGuardShift({ shifts: [...guardShift.shifts, head] }, tail)
  }
  return { guardShift, shifts }
}

const extractShiftsPerGuard = (
  guardsMap: Map<number, DayShiftIntervals[]>,
  allShifts: Shift[]
): Map<number, DayShiftIntervals[]> => {
  if (!allShifts.length) {
    return guardsMap
  }

  const [head, ...tail] = allShifts

  if (head.guardId !== undefined) {
    const initShifts = { shifts: [head] }
    const { guardShift, shifts } = extractGuardShift(initShifts, tail)

    const currentGuardShifts = guardsMap.get(head.guardId) || []

    const intervals: Interval[] = guardShift.shifts.reduce<Interval[]>(
      (acc, val, ind, array) => {
        if (val.state !== GuardState.Asleep || ind === array.length - 1) {
          return acc
        }
        const currentInterval = {
          start: val.dateTime.getMinutes(),
          end: array[ind + 1].dateTime.getMinutes() - 1
        }
        return [...acc, currentInterval]
      },
      []
    )
    guardsMap.set(head.guardId, [...currentGuardShifts, { intervals }])
    return extractShiftsPerGuard(guardsMap, shifts)
  }

  return extractShiftsPerGuard(guardsMap, tail)
}

const wasAsleepAtMinute = (minute: number, intervals: Interval[]) =>
  intervals.some(i => minute >= i.start && minute <= i.end)

// ------------------------------------=----------------------------------------

const solveBetter = (records: string[]): Solution => {
  const orderedRecords = sortShifts(records.map(parseRecord))
  const guardIntervalsMap = extractShiftsPerGuard(new Map(), orderedRecords)

  const timesAsleepPerMinute = Array.from(guardIntervalsMap).reduce<
    Map<number, number[]>
  >((acc, value) => {
    const guardId = value[0]
    const dayShifts = value[1]

    const minutes = Array.from(Array(60)).map((_, minute) =>
      dayShifts.reduce<number>(
        (timesAsleep, { intervals }) =>
          wasAsleepAtMinute(minute, intervals) ? timesAsleep + 1 : timesAsleep,
        0
      )
    )

    acc.set(guardId, minutes)
    return acc
  }, new Map())

  const timesAsleepValues = Array.from(timesAsleepPerMinute)

  // part 1
  const part1 = timesAsleepValues.reduce<GuardMinute>(
    (acc, value) => {
      const timeAsleep = value[1].reduce((sum, times) => sum + times, 0)
      if (acc.timeAsleep < timeAsleep) {
        const maxTimesAsleepMinute = value[1].indexOf(Math.max(...value[1]))
        return { timeAsleep, id: value[0], minute: maxTimesAsleepMinute }
      }

      return acc
    },
    { id: 0, minute: -1, timeAsleep: 0 }
  )

  // part 2
  const part2 = Array.from(Array(60)).reduce<GuardMinute>(
    (acc, _, minute) => {
      const maxTimesAsleepPerMinute = timesAsleepValues.reduce<{
        id: number
        timeAsleep: number
      }>(
        (maxAsleep, current) =>
          maxAsleep.timeAsleep < current[1][minute]
            ? { id: current[0], timeAsleep: current[1][minute] }
            : maxAsleep,
        { id: 0, timeAsleep: 0 }
      )

      if (maxTimesAsleepPerMinute.timeAsleep > acc.timeAsleep) {
        return { ...maxTimesAsleepPerMinute, minute }
      }
      return acc
    },
    { id: 0, minute: -1, timeAsleep: 0 }
  )

  return { part1: part1.id * part1.minute, part2: part2.id * part2.minute }
}

// ------------------------ ALL --------------------------------------------

const solution = (input: string): Solution => {
  const shiftRecords = input.split("\n")
  const result = solveBetter(shiftRecords)
  return { part1: result.part1, part2: result.part2 } // 98680, 9763
}

export default solution
