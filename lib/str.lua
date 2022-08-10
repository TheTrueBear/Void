
--// Make the module for string stuff
local Str = {}

--// Function to safely look at the strings
function Str.Find(String, Pattern)
  -- If the string is a lparen
  if Pattern == "(" then
    return string.find(String, "%(")

  -- If the string is a rparen
  elseif Pattern = ")" then
    return string.find(String, "%)")

  -- If it is safe to search the string
  else
    return string.find(String, Pattern)
  end
end

--// Return the module
return Str
