# PPCPlayer code style

Clang-format takes care of most things, so this basically just devolves into naming conventions.

- All source files should have a license header.

For CMake/Python:

```cmake
# Copyright (C) $YEAR PowerPC Player Authors.
# SPDX-License-Identifier: MIT
```

C++:
```cpp
// Copyright (C) $YEAR PowerPC Player Authors.
// SPDX-License-Identifier: MIT
```

- Types (structures, classes, enums) should be declared as PascalCase. Enumerator value names also generally fall under this rule.
    - Example: 
        ```cpp
        struct MyStructure {};
        class MyClass {};
        enum Tree { Tree_Apple, Tree_Birch, ... }; // Please don't use classical enums
        enum class CoolerTree { Apple, Birch, .... };
        ```
- Most variable names should be camelCase. This doesn't strictly need to be followed; especially if the variable's name isn't multiple words.
    - Example:
        ```cpp
        MyStructure structure{};
        Tree theTree{Tree_Apple};
        CoolerTree coolerTree{CoolerTree::Birch};
        ```