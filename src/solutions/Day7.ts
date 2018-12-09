import { Solution } from "src/DayX"

type Dependency = {
  dependentStep: string
  requiredStep: string
}

type Step = {
  name: string
  dependencies: string[]
}

type Task = {
  name: string
  secondStarted: number
}

const extractDependencyRegex = /Step (.*?) must be finished before step (.*?) can begin/

const calcTaskTime = (step: string) => step.charCodeAt(0) - 4

const getNewAvailableTasks = (
  dependencies: Step[],
  tasksDone: string[],
  tasksInProgress: Task[]
) => {
  const inProgress = new Set(tasksInProgress.map(task => task.name))
  return dependencies
    .filter(step => step.dependencies.every(d => tasksDone.indexOf(d) > -1))
    .map(step => step.name)
    .filter(step => !inProgress.has(step) && tasksDone.indexOf(step) < 0)
}

const performNextStepWithWorkers = (
  currentSecond: number,
  tasksInProgress: Task[],
  tasksDone: string[],
  dependencies: Step[],
  availableWorkers: number
): number => {
  const tasksCompleted = tasksInProgress
    .filter(
      task => currentSecond - task.secondStarted === calcTaskTime(task.name)
    )
    .map(task => task.name)

  const tasksInProgressLeft = tasksInProgress.filter(
    task => tasksCompleted.indexOf(task.name) < 0
  )

  const allTasksDone = tasksDone.concat(tasksCompleted)
  const newAvailableTasks = getNewAvailableTasks(
    dependencies,
    allTasksDone,
    tasksInProgressLeft
  ).sort()

  const workersLeft = availableWorkers + tasksCompleted.length
  const tasksToQueue = newAvailableTasks
    .slice(0, workersLeft)
    .map(task => ({ name: task, secondStarted: currentSecond }))

  const startedTasks = tasksInProgressLeft.concat(tasksToQueue)

  if (startedTasks.length === 0) {
    return currentSecond
  }

  const fastestTaskTime = Math.min(
    ...startedTasks.map(
      task => calcTaskTime(task.name) - currentSecond + task.secondStarted
    )
  )

  return performNextStepWithWorkers(
    currentSecond + fastestTaskTime,
    startedTasks,
    allTasksDone,
    dependencies,
    Math.max(workersLeft - tasksToQueue.length, 0)
  )
}

const findStepSequence = (steps: Step[], sequence: string): string => {
  if (steps.length === 0) {
    return sequence
  }
  const stepsToPerform = steps
    .filter(step => step.dependencies.every(d => sequence.indexOf(d) > -1))
    .map(step => step.name)
  const firstStep = stepsToPerform.sort()[0]

  const stepsLeft = steps.filter(step => step.name !== firstStep)
  return findStepSequence(stepsLeft, sequence + firstStep)
}

const solve = (steps: string[]) => {
  const stepDependencies: Dependency[] = steps.map(step => {
    const parsed = extractDependencyRegex.exec(step)
    const dependentStep = parsed ? parsed[2] : ""
    const requiredStep = parsed ? parsed[1] : ""

    return { dependentStep, requiredStep }
  })

  const dependentSteps = new Set(stepDependencies.map(sd => sd.dependentStep))
  const independentSteps = stepDependencies
    .map(sd => sd.requiredStep)
    .filter(step => !dependentSteps.has(step))

  const dependencyMap = stepDependencies.reduce<Map<string, Step>>(
    (acc, value) => {
      const step = acc.get(value.dependentStep) || {
        name: value.dependentStep,
        dependencies: []
      }
      const dependencies = [...step.dependencies, value.requiredStep]
      acc.set(value.dependentStep, { ...step, dependencies })
      return acc
    },
    new Map()
  )

  const fullDependencyMap = new Map<string, Step>([
    ...dependencyMap,
    ...independentSteps.map<[string, Step]>(step => [
      step,
      { name: step, dependencies: [] }
    ])
  ])

  const allDependencies = Array.from(fullDependencyMap.values())
  // part2
  const workersAvailable = 10

  const part2 = performNextStepWithWorkers(
    0,
    [],
    [],
    allDependencies,
    workersAvailable
  )

  return {
    part2,
    part1: findStepSequence(allDependencies, "")
  }
}

export const addToMap = (
  map: Map<string, string>,
  key: string,
  value: string
) =>
  new Map([
    ...map,
    ...([[key, value], [key, value]] as ReadonlyArray<[string, string]>)
  ])

const solution = (input: string): Solution => {
  const steps = input.split("\n").map(str => str.trim())

  const result = solve(steps)

  return {
    part1: result.part1,
    part2: result.part2
  }
}

export default solution
