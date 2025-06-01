# Private properties

KH2 Lua Library uses an underscore (`_`) as a prefix to denote a few different things:

- Incomplete or experimental features
- Private properties and functions meant for internal use
- Complete features whose implementation may change
  - e.g. Testing an approach to see how it feels, in the interest of finding the best approach overall.

Examples:

- `kh2lua._constants`
- `kh2lua._constants._offsets`

## Why?

Part of the core methodology of this project is to avoid introducing breaking changes for any
mods that depend on it. Like web pages, this enables scripts to continue to work regardless
of future game and library updates, even if they don't take advantage of new enhancements.

As a mod developer, this is great! You don't have to stress about updating your mod every time
the Lua Library updates. However, when developing features for the library, sometimes the correct
approach for an underlying data structure or naming convention can be unclear.
Or the correct approach can even change as more use-cases are found for the feature.
If absolutely every single property has to be backwards-compatible, this can quickly lead to a
lot of code repetition and [technical debt][tech-debt].

There are a few different ways to handle this problem.

### "Just don't release anything incomplete."

One solution would be to hyper-analyze every feature before developing them,
which is time-consuming and could lead to over-engineering, burnout, and too much friction
for new contributors. It could lead to a lot of ideas for enhancements never being pursued.
There are a lot of script authors that could take advantage of a warp function, for example,
even if the function is more complicated than a theoretical ideal version of it.
Waiting to make it "absolutely perfect" could take orders of magnitude longer and
might turn out to be ultimately unrealistic. It would be a shame to hold a useful feature back
in the interest of getting it "perfect" the first time (an unreachable goal, in practice).

### "Just use version numbers to indicate breaking changes."

It would be ideal to be able to make breaking changes by bumping the major version of the project,
but OpenKH does not provide a robust package system through which a mod author
can specify dependencies, let alone _specific versions_ of dependencies. While it would be handy,
as a community-developed project, it's likely too far out of scope and will never exist.

### Mark some areas for internal use only

Another solution, and the one used by this library, is to provide a naming convention for features
that are not guaranteed to be backwards-compatible, or are for internal use only.
As mentioned at the start of this document, KH2 Lua Library combines both of these uses into a single
naming convention: prefixing properties or functions with an underscore.
Lua does not actually have a proper concept of private properties. While you _can_ make local
variables and functions that are not included in a module's "exports," this would disallow other
submodules of the project from using those variables and functions as well. "So, if everything is
(kind of) public, how do we know what's supposed to be private?" Thus, the naming convention.

Both use-cases (internal functions and incomplete features) share the same naming convention
because ultimately, what is being signified is that these properties can change (and break).
It really doesn't matter if the property is meant for internal use or public use; they're provided
because they're _useful to somebody_. The important thing is to allow for their use
without feeling shackled to an implementation that could have been done better in hindsight.

## Can I use a private feature?

Yes. Should you? That depends.

If you write scripts relying on private properties, you may have to update your code in the future.
If you're planning to continue supporting your script and staying on top of changes in the Lua Library,
then that might be fine for you. But if you're trying to build something quick and not touch it
in the future, or building something for the community at large, you're probably best off avoiding
them, at least in your production releases.

## How do I know once a feature is ready?

Once a feature is complete, it will be exposed in a new public property. It may have the same
name (e.g. `kh2lib._constants` -> `kh2lib.constants`), or it may not. Two things will always
accompany a new feature:

1. A bump in the major version (e.g. `2.0.0` -> `3.0.0`).
2. Documentation for the feature in the [reference section][ref-folder].

There are, of course, some private properties that are always intended for internal use
and won't ever be released as public features. Usually this is because another layer of abstraction
is provided somewhere else. For example, `kh2lib._constants` contains all of the lists of constants
in the library, but a more useful reference to them are the lookup tables, such as `kh2lib.worlds`.
There may, however, be unforeseen niche use-cases for a private property not provided by an
abstraction layer. In these cases, you may need to use a private property in your production code.
Just be aware that the property is not guaranteed to be backwards-compatible and you may either need
to update your script in the future or inform its users which version to use.

## What about `_OnInit()` and `_OnFrame()`?

Unfortunately, the original author(s) of the Lua engines for OpenKH did not follow standard naming
conventions. Per the [Lua 5.1 Reference Manual][1],
> "As a convention, names starting with an underscore followed by uppercase letters (such as _VERSION)
> are reserved for internal global variables used by Lua."

Ideally, these functions would have been named `On_Init()` and `On_Frame()`, or even `on_init()` and
`on_frame()` and returned as module properties in a different hypothetical implementation.
In the future, Lua Library may provide aliases using the proper naming convention.
For now, these functions remain as exceptions to the rule as they are not provided by `kh2lib` and
are required for all mod scripts.

## More information

This project primarily follows the [LuaRocks style guide][2], with some minor adjustments
(visible in `.editorconfig`), which helped to inform some of the above decisions.
If you decide to contribute to this project, please try to follow the same conventions.

<!-- Reference links -->
[ref-folder]: /docs/reference/
[tech-debt]: https://github.com/KH2FM-Mods-equations19/KH2-Lua-Library/blob/84528de371273f02b7841483a00ec0ac6b121749/io_packages/kh2lib.lua#L104-L397
[1]: https://www.lua.org/manual/5.1/manual.html#2.1
[2]: https://github.com/luarocks/lua-style-guide
