# Runs brainfuck_testscript.bf located in the same folder as this file

include("brainfuck_interpreter.jl")
dir = @__DIR__
brainfuck_interpreter(dir * "/brainfuck_testscript.bf", "ascii")
