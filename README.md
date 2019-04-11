# Battleship

## Intro

We're going to write some code to model the game of battleship. We've got a
board that looks like this:

```
  0 1 2 3 4 5 6 7 8 9
A
B
C
D
E
F
G
H
I
J
```

On that board, we place some ships. Refer to the specs to see the ship data
that we'll be passing in.

We want to be able to call `fire!` on the `Battleship` instance and see if we hit
a ship (and ideally, the ship's type if we've hit it enough times to sink it).

Your goal is to make the specs pass. Feel free to add additional specs if helpful.

We'd love to see thoughtful commits made explaining the process you're going
through to solve the problem.

If Ruby's not your thing, we'll happily accept submissions in a different language.

Please spend no more than two hours on this exercise. We imagine you've got more
exciting things to do!

## Installation

Feel free to update `.ruby-version` if you've got a more recent version of Ruby
already installed that you'd rather use.

```
git clone git@github.com:bonusly/battleship.git # update to reflect your fork
cd battleship
bundle
```

## Running the specs

`bundle exec rspec battleship_spec.rb`
