#### Interface 

please reference:https://docs.soliditylang.org/en/v0.8.11/contracts.html#interfaces

Interfaces are similar to abstract contracts, but they cannot have any functions implemented. There are further restrictions:

- They cannot inherit from other contracts, but they can inherit from other interfaces.
- All declared functions must be external.
- They cannot declare a constructor.
- They cannot declare state variables.
- They cannot declare modifiers.

