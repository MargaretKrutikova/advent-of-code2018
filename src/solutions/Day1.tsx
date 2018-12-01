import * as React from "react";

type Props = {
  input?: string;
};

type FrequencyState = {
  currentFrequency: number;
  frequencesSeen: Set<number>;
  frequencySeenTwice?: number;
};

const findFirstFrequencySeenTwice = (
  frequencyState: FrequencyState,
  frequencyChanges: number[]
): number => {
  const newState = frequencyChanges.reduce<FrequencyState>((acc, change) => {
    const { currentFrequency, frequencesSeen, frequencySeenTwice } = acc;
    if (frequencySeenTwice) {
      return acc;
    }

    const newFrequency = currentFrequency + change;
    if (frequencesSeen.has(newFrequency)) {
      return { ...acc, frequencySeenTwice: newFrequency };
    }

    frequencesSeen.add(newFrequency);
    return {
      frequencesSeen,
      currentFrequency: newFrequency
    };
  }, frequencyState);

  if (newState.frequencySeenTwice) {
    return newState.frequencySeenTwice;
  }

  return newState.frequencySeenTwice
    ? newState.frequencySeenTwice
    : findFirstFrequencySeenTwice(newState, frequencyChanges);
};

const Day1: React.SFC<Props> = ({ input }) => {
  if (!input) {
    return <div>Not solved yet!</div>;
  }

  const frequencyChanges = input
    .split("\n")
    .filter(change => !!change)
    .map(change => parseInt(change.trim(), 10));

  const resultingFrequency = frequencyChanges.reduce(
    (acc, change) => acc + change,
    0
  );

  const initialState: FrequencyState = {
    currentFrequency: 0,
    frequencesSeen: new Set()
  };

  const firstFrequencySeenTwice = findFirstFrequencySeenTwice(
    initialState,
    frequencyChanges
  );

  return (
    <div>
      Result Part 1: {resultingFrequency}, Result Part 2:
      {firstFrequencySeenTwice}
    </div>
  );
};

export default Day1;
