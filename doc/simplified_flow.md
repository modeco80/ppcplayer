# Simplified control flow

- user runs `ppcplayer [options] [file] -- argv....`
    - ppcplayer initalizes the emulator core
        - loads executable image(s), incl. dependencies
            - relocates dependencies
                - program starts running

# What about Win32 APIs?

maybe we can shim out most of them to the host without issue.

HANDLEs probably wouldn't be an issue, except for module/process objects

.. but they could possibly be indicated by allocating fake handles?


# What if kernel32!CreateProcess is called?

- ppcplayer checks the image that is attempting to be run
    - if it is for the target system, or a platform the target can run natively, it does nothing and simply runs it natively (the handle that is returned is a native win32 handle)
        - if it is powerpc, then ppcplayer starts a new process object internally (allocating a fake handle) and goes from there?

# What about scheduling?

- round robin inside of ppcplayer?
    - this would be kinda iffy performance wise, but dlls could be shared inside of a single ppcplayer instance

or:

- (imo awful) spawn another ppcplayer instance for the child process
    - this would require a reload of loaded dlls (more memory consumption).. but
    - ..this would also allow process objects to have a "real" handle per se?