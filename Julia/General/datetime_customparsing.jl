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

using Dates
s = repeat(["31-1-2000 11:11:11", "28-2-2000 11:11:11", "31-3-2000 11:11:11"], outer=10)

# process timeseries data into simpilar format
function datetime_preprocess(var::AbstractString)
    val = []
    for i in 1:size(var)[1]
        c = [j for j in var[i]]
        d = []
        for k in 1:size(c)[1]
            if !(c[k]=='-' || c[k]==' ' || c[k]==':')
                push!(d, c[k])
            end
        end
        push!(val, join(d) )
    end
    return val
end

# get the datetime format for the timeseries data
function get_dateformat(var::String, function_method)
    str_len = length(var)
    if function_method == Dates.Date
        if str_len == 7
            return Dates.DateFormat("ddmyyyy")
        elseif str_len == 8
            return Dates.DateFormat("ddmmyyyy")
        end
    elseif function_method == Dates.DateTime
        if str_len == 13
            return Dates.DateFormat("ddmyyyyHHMMSS")
        elseif str_len == 14
            return Dates.DateFormat("ddmmyyyyHHMMSS")
        end
    end
end

function datetime_parsing(var::AbstractVector)
    occursin(" ", var[1]) ? function_method = Dates.DateTime : function_method = Dates.Date
    var = datetime_preprocess(var)
    return [(function_method)(var[i], get_dateformat(var[i], function_method)) for i in 1:length(var)]
end

#testing the fucntion
datetime_parsing(s)
