module arr2tex

export array2latex

function array2latex(A :: Array{<:Union{Missing,Real},2}, topRow :: Array{<:Union{Missing,String},2}, leftCol :: Array{<:Union{Missing,String},2})
    nRows,nCols = size(A);
    ident="  ";
    println(raw"\begin{table}")
    println(ident,raw"\begin{center}")
    println(ident,ident,raw"\caption{Your caption here.}")
    println(ident,ident,raw"\label{tab:table1}")
    colsString="{"
    for i=1:nCols
        colsString = colsString * "c|"
    end
    colsString =colsString * "c}"
    println(ident,ident,raw"\begin{tabular}",colsString)
    headerString = "";
    for i=1:nCols
        headerString *= (topRow[i] * raw" & ")
    end
    headerString *= (topRow[nCols+1] * raw" \\ ")
    println(ident,ident,headerString)
    println(ident,ident,raw" \hline")
    for j=1:nRows
        print(ident,ident,leftCol[j]," & ")
        for i=1:nCols-1
            print(A[j,i])
            print(raw" & ")
        end
        print(A[j,nCols])
        println(raw" \\ ")
    end
    println(ident,ident,raw" \hline")
    println(ident,ident,raw"\end{tabular}")
    println(ident,raw"\end{center}")
    println(raw"\end{table}")
    
end

end 