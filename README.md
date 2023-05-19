# PowerPC Player

A project similar to [MS-DOS Player](http://takeda-toshiya.my.coocan.jp/), but instead targeted towards running PowerPC Windows NT binaries.

# Why?

Why not? On a more serious note, this project mostly intends to run PowerPC hosted Visual C++ compilers on normal x86/x64 machines.

# Building

Requirements:

- A mingw-w64 toolchain (or MSVC/clang-cl. Really you just need a windows targeting toolchain, I don't care how you get there)
    - If using mingw-w64 (even with clang?), you need to build a patched winpthreads which doesn't call GetTickCount64() in order to run ppcplayer on XP.
        - A sample patch for mingw-w64 10.0.0 has been provided in doc/

A sample MinGW-w64 hosted build command line might look like:

```
$ cmake -GNinja -Bbuild --toolchain cmake/Toolchains/mingw-i686.cmake -DCMAKE_BUILD_TYPE=Release
[...snip...]
$ ninja -C build
[...further snip...]
# Profit..?
```