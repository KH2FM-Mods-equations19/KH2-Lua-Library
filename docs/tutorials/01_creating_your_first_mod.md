# Tutorial: Creating your first mod <!-- omit in toc -->

> [!NOTE]
> This document serves as an in-depth tutorial for creating your first Lua-based OpenKH mod
> from scratch. If you're just looking to get up and running quickly, copy one of
> the [templates][templates] and go from there.
<!---->
> *Estimated time to complete: **~20 minutes**.*

Looking to create an OpenKH Lua mod and don't know where to begin? Good news, you've found
the right place! This tutorial will take you from zero to hero in no time, **even if you have
no prior programming knowledge.**

If you're looking for a specific section, use the table of contents below to jump right to it.
Otherwise, continue reading.

- [Assumptions](#assumptions)
- [Prerequisites](#prerequisites)
- [Getting started](#getting-started)
  - [Creating a `mod.yml` file](#creating-a-modyml-file)
- [Writing the Lua script](#writing-the-lua-script)
  - [Importing the library](#importing-the-library)
  - [Checking if the script can execute](#checking-if-the-script-can-execute)
  - [Initializing the script](#initializing-the-script)
  - [Running code every game frame](#running-code-every-game-frame)
- [Conclusion](#conclusion)
  - [Further reading](#further-reading)

## Assumptions

This tutorial makes no assumptions about your prior programming knowledge, so you should be able
to follow along even if you have none. The following assumptions, however, will be made:

- You have some proficiency with computers and can easily perform basic tasks like navigating the
file system, creating folders, installing programs, etc.
  - This tutorial will skip over some basics, such as using the File menu in programs.
- You are familiar with OpenKH, the Garden of Assemblage mod, and KH2 Randomizer.
  - You should play a few rando seeds, at minimum, before following this tutorial.
- You are on Windows 10 or later.
  - This guide should be applicable to other platforms, but the instructions will focus on Windows.

If anything about this tutorial is too complex or feels like it goes over your head,
please [let us know][issues]!

## Prerequisites

For development you'll need:

- A text editor. Something as simple as Notepad *technically* works, but a full-fledged IDE, such as
[VS Code][1] is highly recommended for faster (and easier) development.
  - *Recommended*: Install the [Lua VS Code extension][2].
- [OpenKH Mods Manager][4] with KH2 Lua Library (`KH2FM-Mods-equations19/KH2-Lua-Library`) installed.
  - You can find instructions on setting up OpenKH for KH2 Randomizer on the [KH2 Rando website][3].
- A file browser opened to your OpenKH path.

## Getting started

Create a new folder in `openkh\mods\kh2` with the name `hello-world`.
This will be the name of your mod, but don't worry, you can always change it later.
Open this folder in your editor. Create two new files, one named `hello_world.lua`,
and one named `mod.yml`.

### Creating a `mod.yml` file

Open up `mod.yml` and put the following text in it (don't worry, we'll go over it in a second):

```yaml
title: Hello World (v1.0.0)
originalAuthor: YOUR NAME HERE
description: Hello world!
assets:
- name: scripts/hello-world.lua
  method: copy
  source:
  - name: hello-world.lua
```

Let's take it line by line.

```yaml
title: Hello World (v1.0.0)
```

This line shows up as the name of your mod in the mod list. It is convention to include the version number
in the title so that users can easily see what version they're on to check for compatibility.

```yaml
originalAuthor: YOUR NAME HERE
```

This line shows up under the title. Replace `YOUR NAME HERE` with your name/handle.

```yaml
description: Hello world!
```

This is where you provide a description of your mod. It will show up in the right panel in the Mods Manager.

```yaml
assets:
- name: scripts/hello-world.lua
  method: copy
  source:
  - name: hello-world.lua
```

This section tells OpenKH how to install your mod. For Lua mods, you simply need to copy any needed files
from your project over to the `scripts/` folder. To be specific, the first line starts the files section.
The second line defines the name and path of the destination file. The name can be anything, but you
should usually just use the same name as your source file. The third line tells OpenKH to copy the file.
The fourth line says that the next lines will describe the source file(s). The last line defines
the location of the source file.

That's all you need to describe your mod for OpenKH! There are more options available, but they mostly
pertain to visual mods that change character models or similar.

## Writing the Lua script

Open back up `hello-world.lua`. The Lua script is where most of the magic happens. There are a few things
every script does:

1. Imports the KH2 Lua Library (`kh2lib`)
2. Checks if the script can execute
3. Initializes (sets up) the script
4. Performs actions on every frame (usually)

Every script should define two functions `_OnInit()` and `_OnFrame()`. We'll get into how to do that
in a second, but first, it's important to understand what these do.

> [!TIP]
> In programming, whenever you want to create a section of code that can be reused, you define
> a **function.** Functions can contain any amount of code and can be executed (**called**) from
> other parts of the program, or even other programs. Functions can also be provided with information
> (**parameters**) when they are executed, which are passed between parentheses after a function's name.

`_OnInit()` is executed by the Lua engine ([LuaBackend][5] on PC) **once, after all scripts are loaded**.
This means it's used for setting up your script, importing libraries, and anything else that you might
need to do before the game is done booting up.

`_OnFrame()` is executed by the Lua engine **once per game frame.** This is likely where your script
will do most of its work. Here you can perform actions, such as warping the player, based on the
current game state or other criteria.

Let's add definitions for these functions. Add the following code to `hello-world.lua`.

```lua
function _OnInit()
end

function _OnFrame()
end
```

> [!TIP]
> In Lua, you define a function by using the `function` keyword, followed by the name of the function.
> You then include a pair of parentheses with any parameters that the function will need
> when executed inside them (but in this case, don't include any).

Next up, we'll import this library.

### Importing the library

First we need to create some variables. Variables are used to store information and recall it later.

Add the following lines to the top of your file:

```lua
local kh2lib_status, kh2lib, can_execute
local LIBRARY_VERSION = 1
```

The `local` keyword in Lua defines a variable that is only for the current file (or function).
`kh2lib_status` is the name of the first variable, which will eventually contain the status
of the Lua Library. `kh2lib` is the name of the second variable, which is where we'll store
our reference to the Lua Library. `can_execute` is a boolean (a special type of value that
can only be `true` or `false`) that we'll use to signal whether the script is allowed to execute.
The next line defines the variable `LIBRARY_VERSION` and sets its value to 1, which we'll
use a little later.

> [!TIP]
> Variables that should never change are called **constants** and are usually named in all
> uppercase characters.

Now, within the `_OnInit()` function (on a new line before the `end` keyword), add the following code.
Comments (any line starting with `--`) are ignored by the program. They're instead used here
(and generally) to describe what each line does. You can remove them in your final code if you want.

```lua
-- import the lua library (named kh2lib)
kh2lib_status, kh2lib = pcall(require, 'kh2lib')

-- if the library failed to load then...
if not kh2lib_status then
    -- print an error to the console
    ConsolePrint("KH2-Lua-Library mod is not installed", 3)
    -- prevent the script from executing
    can_execute = false
    -- stop running the _OnInit() function
    return
end -- end if statement

-- require that the lua library version included is the number stored in LIBRARY_VERSION (or higher)
RequireKH2LibraryVersion(LIBRARY_VERSION)
```

Optionally, add the following line here as well, if your script should only support PC versions of KH2.

```lua
RequirePCGameVersion()
```

<!-- <details>
<summary>Detailed explanation (click to expand)</summary> -->

Let's break that down section by section.

1. Import the library.

    ```lua
    kh2lib_status, kh2lib = pcall(require, 'kh2lib')
    ```

    The statement `pcall(require, 'kh2lib')` imports the kh2lib module, which is the Lua Library.
    It stores a boolean (`true` or `false`) in the first variable, describing success or failure, and
    it stores the library itself in the second variable (`kh2lib`). The module also runs some code
    when imported to detect the game version and check if the script can execute properly.

2. Check if the import failed (possibly because the mod isn't present).

    ```lua
    if not kh2lib_status then
        ConsolePrint("KH2-Lua-Library mod is not installed", 3)
        can_execute = false
        return
    end
    ```

    An "if statement" checks if a condition is true and, if so, runs some code. In this case,
    it's checking for the scenario where `kh2lib` failed to load by using the `not` keyword in front
    of `kh2lib_status`, which can only be `true` or `false`. So, it only executes when `kh2lib_status`
    is `not` `true`, when it's `false`.

    `ConsolePrint()` is a global function provided by the Lua engine you installed during setup.
    It will print any text in the first argument to the console, and the second argument
    tells it whether to print it as a normal message (0), success message (1),
    warning message (2), or error message (3). This just changes how it looks in the console window.

    The `can_execute` line will later signal to our script that it is not allowed to do anything.

    The `return` keyword stops executing the current function, in this case `_OnInit()`, instantly.

3. Declare the minimum version number.

    ```lua
    RequireKH2LibraryVersion(LIBRARY_VERSION)
    ```

    This line informs the library that your script expects a KH2 Lua Library version of at least 1,
    since it depends on values added in version 1. As newer versions of the library are released,
    scripts may declare that they require a newer version of the library. If you need a higher version,
    simply increase the number in the `LIBRARY_VERSION` variable you defined at the top of the file.

4. Optionally, require a PC version of the game.

    ```lua
    RequirePCGameVersion()
    ```

    This optional line informs the library that your script is only written for the PC ports of KH2 and
    should not be allowed to execute when, say, playing on an emulator version of KH2.

<!-- </details> -->

Now that we've imported the library and handled our version declarations, we can move on.

### Checking if the script can execute

If the library determines that your script should be allowed to execute based on all of the above,
the value of `kh2lib.CanExecute` will be `true`. Scripts can check this value and should not run any
code if the value is `false`. It's important to capture this value in our `can_execute` variable
so that we can perform these checks later.

Let's add a check in both the `_OnInit()` and `_OnFrame()` functions now.

```lua
function _OnInit()
    -- ... skipping over the code we already added

    -- store the value of kh2lib.CanExecute in our script's variable
    can_execute = kh2lib.CanExecute
    -- if we can't execute then...
    if not can_execute then
        -- stop the function instantly (don't do anything else)
        return
    end
    
    -- (your script's setup will go here)
end

function _OnFrame()
    if not can_execute then
        return
    end

    -- (your script's code for each frame will go here)
end
```

Now both of our functions check to see if the script is allowed to do anything before executing
any other code! Scripts might not be allowed to run if the game is not detected, the version doesn't
match, or there was a problem during setup. It's important that, instead of crashing, the script
doesn't run in these cases so that the player can still play with other mods that they might have installed.

> [!IMPORTANT]
> It's crucial that your script checks `kh2lib.CanExecute` **before performing any actions**
> and **before every frame,** otherwise you could run into unexpected behavior, Lua errors,
> or even game crashes.

### Initializing the script

The rest of the `_OnInit()` function is reserved for setting up any code that your script needs to
run after it loads. This can include logging a message to the console, running setup functions, or
really anything you need. In most scripts, this will primarily be used to log a message to the console
saying the script has loaded, so let's go ahead and do that now.

Replace the comment `-- (your script's setup will go here)` with the following line:

```lua
Log("Hello World 1.0.0")
```

Now, when you build & run your mod with OpenKH, your script will log its name to the console once
it's ready!

Give it a try yourself! Launch the OpenKH mods manager. Your mod should be in the list,
but not enabled. Enable it, select Build & Run (or press F5), and wait for the game to boot up.
Once it does, press F2 to open the script console. You should see your message among the scripts!

### Running code every game frame

Now that your mod is up and running, it's time to do something with it! Your mod is going to
keep track of how many times you go to 100 Acre Wood, so that we can be sure you're taking care
of ol' Pooh Bear.

First, we'll need a variable to keep track of the number of visits, and another one to help us
avoid counting a trip twice. Let's add those with the other variables near the top of the file.

```lua
local kh2lib_status, kh2lib, can_execute
local LIBRARY_VERSION = 1
local num_visits = 0
local prev_world
```

Now, in the `_OnFrame()` function, after you check to make sure it's safe to execute,
add the following code:

```lua
-- get the current world ID from memory
local world = kh2lib.current.world

-- check if it's 100 Acre Wood, and that we're not still there from a previous trip
if world == kh2lib.worlds['100_ACRE_WOOD'] and world ~= prev_world then
    -- increase the number of visits
    num_visits = num_visits + 1
    -- log out the total number of trips
    Log('Visited Pooh ' .. num_visits .. ' times.')
end

-- update the previous world for the next frame
prev_world = world
```

Let's break that down a bit.

```lua
local world = kh2lib.current.world
```

This line uses a feature provided by version 3 of the Lua Library to read a byte of the
game's memory and return the ID of the current world.

```lua
if world == kh2lib.worlds['100_ACRE_WOOD'] and world ~= prev_world then
```

This if statement makes two checks:

1. Is the world ID the same as the world ID for 100 Acre Wood?
2. Is the world ID different than the world ID from last frame?

If both of those conditions are true, then we increase the value of `num_visits` by 1
and log a message out to the console. Finally, we store the current world ID in
`prev_world` so that it is ready for the check on the next frame.

> [!TIP]
> That weird pair of dots `..` in the `Log()` function is the **concatenation operator**.
> It takes two strings and sticks them together, one after the other. In many other programming
> languages, you may see this represented by a plus symbol `+`. Lua's just weird like that.

Let's give it a test! Close the game (if you haven't already) and use the Build & Run option
again in OpenKH. This will automatically get the latest changes you made
(assuming you saved your file) and run the game again. If you open the console with F2 again,
then enter 100 Acre Wood, you should see your message! Go back and forth from the GoA to see
the number increase.

## Conclusion

Congratulations, you've made your first OpenKH Lua mod! Here is the full code for the script
you just wrote:

```lua
local kh2lib_status, kh2lib, can_execute
local LIBRARY_VERSION = 1
local num_visits = 0
local prev_world

function _OnInit()
    kh2lib_status, kh2lib = pcall(require, 'kh2lib')

    if not kh2lib_status then
        ConsolePrint("KH2-Lua-Library mod is not installed", 3)
        can_execute = false
        return
    end

    RequireKH2LibraryVersion(LIBRARY_VERSION)
    can_execute = kh2lib.CanExecute

    if not can_execute then
        return
    end

    Log("Hello World 1.0.0")
end

function _OnFrame()
    local world = kh2lib.current.world

    if world == kh2lib.worlds['100_ACRE_WOOD'] and world ~= prev_world then
        num_visits = num_visits + 1
        Log('Visited Pooh ' .. num_visits .. ' times.')
    end

    prev_world = world
end
```

Feel free to experiment and change your script to see what happens. For example,
how might you log out the name of every world the player visits?

If something went wrong, see if your code matches the block above. If you still need help,
try reaching out in the `#mod-discussion` channel in the KH2 Randomizer Discord server.

### Further reading

If you want to learn more, check out the rest of our [tutorials][tut-folder].
For guides on how to perform more specific actions, see the [guides section][guide-folder].
Have ideas on how this tutorial could be improved? Let us know by [opening an issue][issues].

<!-- Reference links -->
[templates]: /templates/
[tut-folder]: ./
[guide-folder]: /docs/how_to_guides/
[issues]: https://github.com/KH2FM-Mods-equations19/KH2-Lua-Library/issues
[1]: https://code.visualstudio.com/
[2]: https://marketplace.visualstudio.com/items?itemName=sumneko.lua
[3]: https://kh2rando.com
[4]: https://kh2rando.com/downloads
[5]: https://github.com/Sirius902/LuaBackend/
