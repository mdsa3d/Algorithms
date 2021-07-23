#= python (pandas to_datetime())
df = pd.DataFrame({'year': [2015, 2016],
                   'month': [2, 3],
                   'day': [4, 5]})
pd.to_datetime(df)
#=output
0   2015-02-04
1   2016-03-05
dtype: datetime64[ns]
=#
pd.to_datetime('13000101', format='%Y%m%d', errors='ignore')
#Output :-> datetime.datetime(1300, 1, 1, 0, 0)

s = pd.Series(['3/11/2000', '3/12/2000', '3/13/2000'] * 10)
pd.to_datetime(s, infer_datetime_format=True)
pd.to_datetime(s, infer_datetime_format=False)
=#

#Julia 

using Dates
s = repeat(["31-1-2000 11:11:11", "29-2-2000 22:22:22", "31-3-2000 11:11:55"], outer=10)

# get the datetime format for the timeseries data
function get_dateformat(var::String, function_method)
    str_len = length(var)
    if function_method == Dates.Date
        if str_len == 9
            return Dates.DateFormat("dd-m-yyyy")
        elseif str_len == 10
            return Dates.DateFormat("dd-mm-yyyy")
        end
    elseif function_method == Dates.DateTime
        if str_len == 18
            return Dates.DateFormat("dd-m-yyyy HH:MM:SS")
        elseif str_len == 19
            return Dates.DateFormat("dd-mm-yyyy HH:MM:SS")
        end
    end
end

function datetime_parsing(var::AbstractVector)
    occursin(" ", var[1]) ? function_method = Dates.DateTime : function_method = Dates.Date
    return [(function_method)(var[i], get_dateformat(var[i], function_method)) for i in 1:length(var)]
end

#testing the fucntion
datetime_parsing(s)

#=
function datetime_parsing(var::AbstractVector)
    occursin(" ", var[1]) ? function_method = Dates.DateTime : function_method = Dates.Date
    date_time = []
    for i in 1:length(var)
        if length(var[i])==9
            push!(date_time, (function_method)(var[i], DateFormat("dd-m-yyyy")))
        elseif length(var[i])==10
            push!(date_time, (function_method)(var[i], DateFormat("dd-mm-yyyy")))
        end
    end
    return date_time
end
=#
