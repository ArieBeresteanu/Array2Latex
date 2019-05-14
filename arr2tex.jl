module arr2tex

export array2latex

function array2latex(A :: Array{<:Union{Missing,Real},2}, topRow :: Array{<:Union{Missing,String},2}, leftCol :: Array{<:Union{Missing,String},2})
    nRows,nCols = size(A);
    ident="  "; #ident is two spaces
	
	#decleration of the table
    println(raw"\begin{table}")
    println(ident,raw"\begin{center}")
	
	#caption and label - you should change that
    println(ident,ident,raw"\caption{Your caption here.}")
    println(ident,ident,raw"\label{tab:table1}")
    
	#table columns definition (everything centered) 
	colsString="{"
    for i=1:nCols
        colsString = colsString * "c|"
    end
    colsString =colsString * "c}"
    println(ident,ident,raw"\begin{tabular}",colsString)
    
	#table first row with the names of the columns 
	headerString = "";
    for i=1:nCols
        headerString *= (topRow[i] * raw" & ")
    end
    headerString *= (topRow[nCols+1] * raw" \\ ")
    println(ident,ident,headerString)
    println(ident,ident,raw" \hline") #adding a line below the first row 
	
	# the content of the table. Each line start with the row name
    for j=1:nRows
        print(ident,ident,leftCol[j]," & ")
        for i=1:nCols-1
            print(A[j,i])
            print(raw" & ")
        end
        print(A[j,nCols])
        println(raw" \\ ")
    end
    println(ident,ident,raw" \hline") #adding a line at the bottom
	
	#closing the table tags
    println(ident,ident,raw"\end{tabular}")
    println(ident,raw"\end{center}")
    println(raw"\end{table}")
    
end #of function array2latex

end  #of module