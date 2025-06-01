--- @meta

--- Memory address
--- @alias address integer

--- If you define `_OnInit()`, it will be called once, when the script first loads.
--- Use it to perform any setup needed by your script.
---
--- You should check `kh2lib.CanExecute` before performing any actions.
function _OnInit() end

--- If you define `_OnFrame()`, it will be called before every game frame.
---
--- You should always check `kh2lib.CanExecute` before performing any actions.
function _OnFrame() end

-- #region | Variables

--- The current game's CRC32 checksum as an integer.
--- This checksum is generated from the process name at this moment.
--- @type integer
GAME_ID = 0

--- The name of your Lua script, used by functions such as ConsolePrint.
--- It is the filename of your Lua by default.
--- @type string
LUA_NAME = ''

--- The path which Lua scripts are loaded from as a string.
--- Ex: `"C:\Users\Topaz\Desktop\LuaBackend\scripts"`
--- @type string
SCRIPT_PATH = ''

--- Always returns `"NOT_AVAILABLE"`.
--- @type 'NOT_AVAILABLE'
CHEATS_PATH = 'NOT_AVAILABLE'

--- Returns the LuaBackend's engine version as a float. Ex: `4.1`
--- @type number
ENGINE_VERSION = 0

--- Always returns `"BACKEND"`
--- @type 'BACKEND'
ENGINE_TYPE = 'BACKEND'

-- #endregion

-- #region | Memory Functions

--- Read a byte from `address`, relative to base address, and return the read value.
--- @param address address address to read from
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- @return integer
--- Example:
--- ```lua
--- local temp_byte = ReadByte(0xB007555) -- Read a byte from address GameModule+0xB007555
--- ```
function ReadByte(address, absolute) end

--- Read two bytes from `address`, relative to base address, and return the read value.
--- @param address address address to read from
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- @return integer
--- Example:
--- ```lua
--- local temp_short = ReadShort(0xDEFDB42) -- Read two bytes from address GameModule+0xDEFDB42
--- ```
function ReadShort(address, absolute) end

--- Read an integer from `address`, relative to base address, and return the read value.
--- @param address address address to read from
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- @return integer
--- Example:
--- ```lua
--- local temp_int = ReadInt(0xDEADB00) -- Read an integer from address GameModule+0xDEADB00
--- ```
function ReadInt(address, absolute) end

--- Read a long from `address`, relative to base address, and return the read value.
--- @param address address address to read from
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- @return number
--- Example:
--- ```lua
--- local temp_long = ReadLong(0xDEADB00) -- Read a long from address GameModule+0xDEADB00
--- ```
function ReadLong(address, absolute) end

--- Read a float from `address`, relative to base address, and return the read value.
--- @param address address address to read from
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- @return number
--- Example:
--- ```lua
--- local temp_float = ReadFloat(0xDEADB00) -- Read a float from address GameModule+0xDEADB00
--- ```
function ReadFloat(address, absolute) end

--- Read a string from `address`, relative to base address, and return the read value.
--- @param address address address to read from
--- @param length integer length of string to read
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- @return string
--- Example:
--- ```lua
--- local temp_str = ReadString(0xDEADB00, 8) -- Read a string from address GameModule+0xDEADB00
--- ```
function ReadString(address, length, absolute) end

--- Read a boolean from `address`, relative to base address, and return the read value.
--- @param address address address to read from
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- @return boolean
--- Example:
--- ```lua
--- local is_bool = ReadBoolean(0xDEADB00) -- Read a boolean from address GameModule+0xDEADB00
--- ```
function ReadBoolean(address, absolute) end

--- Read `length` amount of bytes from memory, starting at `address` (relative to base address), and return the read bytes as an array.
--- @param address address address to read from
--- @param length integer number of bytes to read
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- @return table
--- Example:
--- ```lua
--- local temp_arr = ReadArray(0xBEEFDED, 0x10) -- Reads 16 bytes starting at GameModule+0xBEEFDED
--- ```
function ReadArray(address, length, absolute) end

--- Writes `value` to `address`, relative to the base address.
--- @param address address address to write to
--- @param value integer byte to write
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- Example:
--- ```lua
--- WriteByte(0xDEADB00, 0xFF) -- Write 0xFF to GameModule+0xDEADB00
--- ```
function WriteByte(address, value, absolute) end

--- Writes `value` to `address`, relative to the base address.
--- @param address address address to write to
--- @param value integer two bytes to write
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- Example:
--- ```lua
--- WriteShort(0xDEADB00, 0xFFFF) -- Write 0xFFFF to GameModule+0xDEADB00
--- ```
function WriteShort(address, value, absolute) end

--- Writes `value` to `address`, relative to the base address.
--- @param address address address to write to
--- @param value integer integer to write
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- Example:
--- ```lua
--- WriteInt(0xDEADB00, 0xFFFFFFFF) -- Write 0xFFFFFFFF to GameModule+0xDEADB00
--- ```
function WriteInt(address, value, absolute) end

--- Writes `value` to `address`, relative to the base address.
--- @param address address address to write to
--- @param value number long to write
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- Example:
--- ```lua
--- WriteLong(0xDEADB00, 0xFFFFFFFFFFFFFFFF) -- Write 0xFFFFFFFFFFFFFFFF to GameModule+0xDEADB00
--- ```
function WriteLong(address, value, absolute) end

--- Writes `value` to `address`, relative to the base address.
--- @param address address address to write to
--- @param value number float to write
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- Example:
--- ```lua
--- WriteFloat(0xDEADB00, 0xFFFFFFFF) -- Write 0xFFFFFFFF to GameModule+0xDEADB00
--- ```
function WriteFloat(address, value, absolute) end

--- Writes `value` to `address`, relative to the base address.
--- @param address address address to write to
--- @param value string string to write
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- Example:
--- ```lua
--- WriteString(0xDEADB00, 'foo') -- Write 'foo' to GameModule+0xDEADB00
--- ```
function WriteString(address, value, absolute) end

--- Writes `value` to `address`, relative to the base address.
--- @param address address address to write to
--- @param value boolean boolean to write
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- Example:
--- ```lua
--- WriteBoolean(0xB007555, true) -- Write true to GameModule+0xB007555
--- ```
function WriteBoolean(address, value, absolute) end

--- Writes `array` to the memory, starting at `address`, relative to the base address.
--- The array must be made of bytes (8-bit integers).
--- @param address address address to write to
--- @param array boolean array of bytes to write
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- Example:
--- ```lua
--- local temp_arr = { 0xFE, 0xA5, 0x70 }
--- WriteArray(0x6660420, temp_arr) -- Writes temp_arr to memory, starting at GameModule+0x6660420
--- ```
function WriteArray(address, array, absolute) end

--- Calculate a pointer with the given values.
--- Read the value at `address` and add `offset` to it. Return the resulting value.
--- @param address address address to read from
--- @param offset integer offset to apply to the read value
--- @param absolute? boolean If set to true, the address is taken as written and base address is not added into it. **Default:** `false`.
--- @return number
--- Example:
--- ```lua
--- local pointer = GetPointer(0xBEEFDAD, 0x15) -- Reads the value at GameModule+0xBEEFDAD and adds 0x15 to it.
--- ```
function GetPointer(address, offset, absolute) end

-- #endregion

-- #region | Absolute Address Functions

--- Read a byte from absolute `address` and return the read value.
--- @param address address address to read from
--- @return integer
--- Example:
--- ```lua
--- local temp_byte = ReadByteA(0xB007555) -- Read a byte from address 0xB007555
--- ```
function ReadByteA(address) end

--- Read two bytes from absolute `address` and return the read value.
--- @param address address address to read from
--- @return integer
--- ```lua
--- local temp_short = ReadShortA(0xDEFDB42) -- Read two bytes from address 0xDEFDB42
--- ```
function ReadShortA(address) end

--- Read an int from absolute `address` and return the read value.
--- @param address address address to read from
--- @return integer
--- Example:
--- ```lua
--- local temp_int = ReadIntA(0xDEADB00) -- Read an integer from address 0xDEADB00
--- ```
function ReadIntA(address) end

--- Read a long from absolute `address` and return the read value.
--- @param address address address to read from
--- @return number
--- Example:
--- ```lua
--- local temp_long = ReadLongA(0xDEADB00) -- Read a long from address 0xDEADB00
--- ```
function ReadLongA(address) end

--- Read a float from absolute `address` and return the read value.
--- @param address address address to read from
--- @return number
--- Example:
--- ```lua
--- local temp_float = ReadFloatA(0xDEADB00) -- Read a float from address 0xDEADB00
--- ```
function ReadFloatA(address) end

--- Read a string from absolute `address` and return the read value.
--- @param address address address to read from
--- @param length integer length of string to read
--- @return string
--- Example:
--- ```lua
--- local temp_str = ReadStringA(0xDEADB00, 8) -- Read a string from address 0xDEADB00
--- ```
function ReadStringA(address, length) end

--- Read a boolean from absolute `address` and return the read value.
--- @param address address address to read from
--- @return boolean
--- Example:
--- ```lua
--- local is_bool = ReadBooleanA(0xDEADB00) -- Read a boolean from address 0xDEADB00
--- ```
function ReadBooleanA(address) end

--- Read `length` bytes from absolute `address` and return the read bytes as an array.
--- @param address address address to read from
--- @return table
--- Example:
--- ```lua
--- local temp_arr = ReadArrayA(0xBEEFDED, 0x10) -- Read 16 bytes starting at 0xBEEFDED
--- ```
function ReadArrayA(address, length) end

--- Write `value` to absolute `address`.
--- @param address address address to write to
--- @param value integer byte to write
--- Example:
--- ```lua
--- WriteByteA(0xDEADB00, 0xFF) -- Write 0xFF to 0xDEADB00
--- ```
function WriteByteA(address, value) end

--- Write `value` to absolute `address`.
--- @param address address address to write to
--- @param value integer two bytes to write
--- Example:
--- ```lua
--- WriteShortA(0xDEADB00, 0xFFFF) -- Write 0xFFFF to 0xDEADB00
--- ```
function WriteShortA(address, value) end

--- Write `value` to absolute `address`.
--- @param address address address to write to
--- @param value integer integer to write
--- Example:
--- ```lua
--- WriteIntA(0xDEADB00, 0xFFFFFFFF) -- Write 0xFFFFFFFF to 0xDEADB00
--- ```
function WriteIntA(address, value) end

--- Write `value` to absolute `address`.
--- @param address address address to write to
--- @param value number long to write
--- Example:
--- ```lua
--- WriteLongA(0xDEADB00, 0xFFFFFFFFFFFFFFFF) -- Write 0xFFFFFFFFFFFFFFFF to 0xDEADB00
--- ```
function WriteLongA(address, value) end

--- Write `value` to absolute `address`.
--- @param address address address to write to
--- @param value number float to write
--- Example:
--- ```lua
--- WriteFloatA(0xDEADB00, 0xFFFFFFFF) -- Write 0xFFFFFFFF to 0xDEADB00
--- ```
function WriteFloatA(address, value) end

--- Write `value` to absolute `address`.
--- @param address address address to write to
--- @param value string string to write
--- Example:
--- ```lua
--- WriteStringA(0xDEADB00, 'foo') -- Write 'foo' to 0xDEADB00
--- ```
function WriteStringA(address, value) end

--- Write `value` to absolute `address`.
--- @param address address address to write to
--- @param value boolean boolean to write
--- Example:
--- ```lua
--- WriteBooleanA(0xB007555, true) -- Write true to 0xB007555
--- ```
function WriteBooleanA(address, value) end

--- Write `array` to memory, starting at absolute `address`.
--- The array must be made of bytes (8-bit integers).
--- @param address address address to write to
--- @param array table array of bytes to write
--- Example:
--- ```lua
--- local temp_arr = { 0xFE, 0xA5, 0x70 }
--- WriteArrayA(0x6660420, temp_arr) -- Writes temp_arr to memory, starting at 0x6660420
--- ```
function WriteArrayA(address, array) end

--- Calculate a pointer with the given values.
--- Effectively, read the value at absolute `address` and add `offset` to it. Return the resulting value.
--- @param address address address to read from
--- @param offset address offset to apply
--- Example:
--- ```lua
--- local pointer = GetPointerA(0xBEEFDAD, 0x15) -- Reads the value at 0xBEEFDAD and adds 0x15 to it.
--- ```
function GetPointerA(address, offset) end

-- #endregion

-- #region | General I/O Functions

--- Get the frequency of which LuaBackend scripts execute.
--- @return 60|120|240
function GetHertz() end

--- Set the LuaBackend execution cycle to `frequency`.
--- @param frequency 60|120|240 value to set for execution frequency (60, 120, or 240)
function SetHertz(frequency) end

--- Shift `base` left by `shift` amount of bytes. Only exists for 32-bit applications.
--- @param base number number on which to apply the shift
--- @param shift integer number of bytes to shift left
--- Example:
--- ```lua
--- ULShift32(4294967295, 8) -- Shifts 4294967295 left by 8 bytes without an overflow to 64-bits.
--- ```
function ULShift32(base, shift) end

--- @enum PrintType
local types = {
    MESSAGE = 0,
    SUCCESS = 1,
    WARNING = 2,
    ERROR = 3,
}

--- Print `text` to the console.
--- If `type` is declared, message is prefixed and colored appropriately.
--- @param text string text to print
--- @param type? PrintType message type. **Default:** nil.
--- Format:
--- ```text
--- [LUA_NAME] TYPE: Text
--- ```
--- Example:
--- ```
--- LUA_NAME = "SomeDudeScript"
--- ConsolePrint("GET UP ON THE HYDRA'S BACK!")
--- -- Result: [SomeDudeScript] GET UP ON THE HYDRA'S BACK!
--- ConsolePrint("NICE VIEW FROM UP HERE!", 0)
--- -- Result: [SomeDudeScript] MESSAGE: NICE VIEW FROM UP HERE!
--- ```
function ConsolePrint(text, type) end

-- #endregion

-- #region | Discord RPC

--- Initialize and hook a Discord application with `applicationId`, for Rich Presence control.
--- @param applicationId number Discord application ID
--- Example:
--- ```lua
--- -- Initiaize Discord Application "833511404274974740".
--- InitializeRPC("833511404274974740")
--- ```
function InitializeRPC(applicationId) end

--- Update the details of the rich presence application initialized with `InitializeRPC()` to `text`.
--- @param text string details text
--- Example:
--- ```lua
--- -- Update the details section of the RPC to say "Hello World!".
--- UpdateDetails("Hello World!")
--- ```
function UpdateDetails(text) end

--- Update the state of the rich presence application initialized with `InitializeRPC()` to `text`.
--- @param text string state text
--- Example:
--- ```lua
--- -- Update the state section of the RPC to say "Hello World!".
--- UpdateState("Hello World!")
--- ```
function UpdateState(text) end

--- Update the large image of the rich presence to be the image with `key`.
--- Update its text to `text`.
--- @param key string image key
--- @param text string image text
--- Example:
--- ```lua
--- -- Update the large image to "image" and its text to "This is Image!"
--- UpdateLImage("image", "This is Image!")
--- ```
function UpdateLImage(key, text) end

--- Update the small image of the rich presence to be the image with `key`.
--- Update its text to `text`.
--- @param key string image key
--- @param text string image text
--- Example:
--- ```lua
--- -- Update the small image to "imagetwo" and its text to "This too, is Image!"
--- UpdateSImage("imagetwo", "This too, is Image!")
--- ```
function UpdateSImage(key, text) end

--- **LuaBackend only!**
---
--- Write the given byte array `value` to `address` relative to the current EXE's address,
--- NOT the provided base address.
--- @param address address address relative to current executable
--- @param value number value to write
--- Example:
--- ```lua
--- WriteExec(0x00FBAAD, 0x15) -- Writes 0x15 to EXE_NAME.exe+0x00FBAAD.
--- ```
function WriteExec(address, value) end

-- #endregion
