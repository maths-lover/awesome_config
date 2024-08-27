# AwesomeWM Modular Configuration

This repository contains a modular configuration for the Awesome Window Manager. The goal of this setup is to provide a clean and organized structure, making it easier to maintain, customize, and extend your window management experience. Each component of the configuration is split into individual modules for better reusability and separation of concerns.

## Features

- **Modular Structure:** Components such as keybindings, widgets, rules, signals, and configuration variables are separated into their own modules.
- **Easily Configurable:** Modify or add new modules without disrupting the core configuration.
- **Error Handling:** Centralized error handling to ensure that errors are caught and displayed cleanly.
- **Custom Widgets:** Includes common widgets like layoutbox, taglist, and tasklist, all in modular form.

## Directory Structure

Here is a breakdown of the directory structure:
```console
.
├── bindings # all sort of bindings
│   ├── client
│   │   ├── key.lua
│   │   └── mouse.lua
│   ├── global
│   │   ├── key.lua
│   │   └── mouse.lua
│   ├── init.lua
│   ├── mod.lua
│   └── widgets
│       ├── layoutbox.lua
│       ├── taglist.lua
│       └── tasklist.lua
├── config # any variables and configuration related variables like default apps, layout structure, tag names, etc.
│   ├── apps.lua
│   ├── init.lua
│   └── vars.lua
├── errors # to perform error handling
│   └── init.lua
├── modules # any external modules like bling, lain, etc.
│   └── init.lua
├── rc.lua
├── README.md
├── rules # Any kind of rules, like window rules on specific tag, etc.
│   └── init.lua
├── signals # signal related things, like audio, notification, rules, screens, tags, etc.
│   ├── client
│   │   └── init.lua
│   ├── init.lua
│   ├── naughty
│   │   └── init.lua
│   ├── ruled
│   │   └── init.lua
│   ├── screen
│   │   └── init.lua
│   └── tag
│       └── init.lua
└── widgets # all eyecandy here
    ├── init.lua
    ├── menu.lua
    └── wibar # The baaaaarrrrrr!!!
        ├── init.lua
        ├── layoutbox.lua
        ├── taglist.lua
        └── tasklist.lua

17 directories, 29 files
```
