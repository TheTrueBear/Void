

--// Requirements
local Str = require("lib/str")

--// Make the lexer class with default variables
local Lexer = {
  Text = "",
  Fn   = "",
  Pos  = nil,
  CC   = nil
}

--// Lexer constructor
function Lexer.new(Text, Fn)
  -- Make the metatable
  local self = setmetatable({}, Lexer)

  -- Variables
  self.Text = Text
  self.Fn   = Fn
  self.Pos  = 0
  self.CC   = nil
  self:Advance()

  -- Return self
  return self
end

--// Indexing function
function Lexer.__index(Table, Key)
  return Lexer[Key]
end

--// Advancement function
function Lexer:Advance()
  -- Increment the position
  self.Pos = self.Pos + 1

  -- Get the character
  if self.Pos <= string.len(self.Text) then
    self.CC = string.sub(self.Text, self.Pos, self.Pos)
  else
    self.CC = nil
  end
end

--// Tokenize a string
function Lexer:Tokenize()
  -- Make the tokens table
  local Tokens = {}

  -- Loop while there is a character
  while self.CC ~= nil do
    -- Ignore spaces and tabs
    if Str.Find(" \t", self.CC) then
      self:Advance()

    -- Errors
    else
      return {}, nil
    end
  end

  -- Return the tokens and the error
  return Tokens, nil

--// Return the lexer class
return Lexer
