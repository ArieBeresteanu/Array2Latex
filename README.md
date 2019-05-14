# Array2Latex
## Purpose
This repo includes code that transforms an array into LaTeX script for creating a table in your paper. The purpose is to expedite the process of transfering your computational results into your publication. The first commit is just in Julia but I would love to expand this to other languages as well. As usual, comments, push requests and suggestions are welcome. 

## Instalation
1. Clone/download arr2tex.jl to your favorite directory.
2. Add that directory to the path (if it's not already there (something like: push!(LOAD_PATH,"C:/main_directory/sub_directory/") but with your directories name)
3. Bring it to your code or notebook with the following command:  using arr2tex

## Comments
The module exports one function:

```julia
function array2latex(A :: Array{<:Union{Missing,Real},2}, topRow :: Array{<:Union{Missing,String},2}, leftCol :: Array{<:Union{Missing,String},2})
    nRows,nCols = size(A);
```
There is a simple Jupiter notebook that demonstrates how to call the function array2latex.

**Note**: The code probably reflects my poor Julia skills. I'm still learning it...

[My Pitt webpage](http://www.pitt.edu/~arie)
