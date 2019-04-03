" Function to sort import statements in Kotlin file

python3 << EOL
import re
def SortImports():
    """Sort the imports from the buffer """

    buffer_lines = vim.current.buffer

    start = 0
    end = 0

    for i, value in enumerate(buffer_lines):


        if re.match("^$", buffer_lines[i]):

            # If we have reached the imports yet, just set the start index to current line
            if end == 0:
                start = i

            # We are at the end
            else:
                break

        if re.match("^import ", buffer_lines[i]):
            end = i

    # Start is currently a blank line.
    # Move it to the first import statement
    start = start + 1

    # Sort the lines in the provided range
    imports = sorted(buffer_lines[start:end])

    # Replace the lines
    for i, value in enumerate(imports):
        buffer_lines[i + start] = value

EOL
map <F6> :python3 SortImports()<CR>
