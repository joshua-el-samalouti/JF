# Brainfuck Interpreter

function brainfuck_interpreter(path, output_mode)
    # output_mode "ascii" or "numeric"
    open(path, "r") do file
        script = read(file, String)

        bytearray = Dict(
            1 => 0
        )
        pointer = 1
        index = 1
        while index <= length(script)
            if script[index] == '+'
                if bytearray[pointer] == 255
                    bytearray[pointer] = 0
                else
                    bytearray[pointer] = bytearray[pointer] + 1
                end
            elseif script[index] == '-'
                if bytearray[pointer] == 0
                    bytearray[pointer] = 255
                else
                    bytearray[pointer] = bytearray[pointer] - 1
                end
            elseif script[index] == '>'
                pointer += 1
                if !haskey(bytearray,pointer)
                    bytearray[pointer] = 0
                end
            elseif script[index] == '<'
                pointer -= 1
                if !haskey(bytearray,pointer)
                    bytearray[pointer] = 0
                end
            elseif script[index] == '['
                if bytearray[pointer] == 0
                    depth = 1
                    while depth > 0
                        index += 1
                        if script[index] == '['
                            depth += 1
                        elseif script[index] == ']'
                            depth -= 1
                        end
                    end
                end
            elseif script[index] == ']'
                if bytearray[pointer] != 0
                    depth = 1
                    while depth > 0
                        index -= 1
                        if script[index] == '['
                            depth -= 1
                        elseif script[index] == ']'
                            depth += 1
                        end
                    end
                end
            elseif script[index] == '.'
                if output_mode == "ascii"
                    print(Char(bytearray[pointer]))
                elseif output_mode == "numeric"
                    print(bytearray[pointer])
                end
            end
            index += 1
        end
    end
end
