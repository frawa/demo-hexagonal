# Demo Haxagonal Architecture, using ELM

## Thoughts
### Script

Start simple
- In File `tests/Tests.elm`
    - test simple `discount0` function
- In file `src/Discount.elm`
    - start with simple `discount0` function
- In file 'src/App.elm` 
    - calculate discount on input

Refactor to open second port
- In File `tests/Tests.elm`
    - test `discount`
    - with `discountTenth`
- In file `src/Discount.elm`
    - function `discount`
    - additional argument  `discountRate` function
- In file 'src/App.elm` 
    - wire `discount discountHalf`

Add step functions
- In File `tests/Tests.elm`
    - test `discountSteps`
- In file `src/Discount.elm`
    - add `discountSteps`
- In file `src/App.elm` 
    - add node.js app for endpoint `/discount-steps`
    - query that endpoint
    - use `discountSteps`

_TODO_
- query steps data from NodeJS app
- in `App.elm`
- NodeJS endpoint

## Preparation

_TODO_

- tests run automatically on safe
- app on refresh in the browser

