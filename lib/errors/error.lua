
--// Make the class
local Error = {}

--// Constructor
function Error.new(Name, Details)
  -- Make the metatable
  local self = setmetatable({}, Error)

  -- Set the paremeters
  self.Name = Name
  self.Details = Details

  -- Return
  return self
end

--// Indexer
function Error.__index(Table, Key)
  return Error[Key]
end

--// As string
function Error:AsStr()
  local Result = string.format("%s: %s", self.Name, self.Details)
  return Result
end

--// Return the class
return Error
