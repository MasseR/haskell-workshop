# Exercises

We will be building an application for transforming a CSV file into JSON.

## Set up tooling

*You should do the first exercise in advance.*

The goal of the first task is to have your system ready for the workshop.
Ideally this step would be done at home before the workshop.

- Install stack
  - https://docs.haskellstack.org/en/stable/install_and_upgrade/#macos
  - https://docs.haskellstack.org/en/stable/install_and_upgrade/#installupgrade
- Build the hello world project with `stack build`
- Try out repl `stack repl`
- Try out `stack build --file-watch`  and modifying source files

## Presenting hello world

The goal of this task is to get some kind of visibility into Haskell programs
and syntax. We will cover the basics of the syntax, types and using the repl.
We will provide you a cheatsheet of the functions that should make the rest of
the workshop possible.

- Go through the hello world with the presentators
- Go through some of the haskell syntax with the presentators
- You should read through the cheatsheet

## Writing the domain model

The goal of this task is to implement the data model for the application. We
will explain the application we're going to build. The data for the application
can be found on the [data folder](../data).

- The presentators will present the goal of the workshop
- The presentators will present the data model
- The presentators will present a subset of the type syntax
- You will create your data model and test it out in the repl

## Writing the transformations

The goal of this task is to write the transformation from a single line of CSV
into a our data model.

- The presentators will present function composition
- The presentators will present pattern matching
- You will create the functions needed for transforming a line of CSV into your model type

## Putting it all together

The goal of this task is to finish the application. You should write two
functions in here, a pure function that transforms the file contents into a
list of models, and an impure function that reads the file from disk and prints
out json.

- The presentators will explain type tetris
- The presentators will explain the absolute basics of IO
- The presentators will present the do-syntax
