mutable struct data

end
object = data()
# Available radial basis functions that can be selected as strings;
# they all start with _h_ (self._init_function relies on that)
function multiquadric(r)
    val = sqrt(1.0/epsilon*r)^2 + 1.0
    return val
end
function inverse_multiquadric(self, r)
    return 1.0/sqrt(1.0/self.epsilon*r)^2 + 1
end
function gaussian(r)
    return exp(-(1.0/epsilon*r)^2)
end
function linear(r)
    return r
end
function cubic(r)
    return r^3
end
function quintic(r)
    return r^5
end
function thin_plate(r)
    return xlogy(r^2, r)
end

function radial(r)
    if isinstance(function, str)
        self.function = self.function.lower()
        _mapped = {"inverse": "inverse_multiquadric",
                    "inverse multiquadric": "inverse_multiquadric",
                    "thin-plate": "thin_plate"}
        if radial in _mapped
            radial = _mapped[radial]
        end
        func_name = "_h_" + self.function
        if hasattr(self, func_name):
            self._function = getattr(self, func_name)
        else
            functionlist = [x[3:] for x in dir(self)
                            if x.startswith('_h_')]
            raise ValueError("function must be a callable or one of " +
                             ", ".join(functionlist))
        self._function = getattr(self, "_h_"+self.function)
    elif callable(self.function):
        allow_one = False
        if hasattr(self.function, 'func_code') or \
            hasattr(self.function, '__code__'):
            val = self.function
            allow_one = True
        elseif hasattr(self.function, "__call__")
            val = self.function.__call__.__func__
        else
            raise ValueError("Cannot determine number of arguments to function")
        end
        argcount = val.__code__.co_argcount
        if allow_one and argcount == 1
            self._function = self.function
        elseif argcount == 2
            self._function = self.function.__get__(self, Rbf)
        else
            raise ValueError("Function argument must take 1 or 2 arguments.")
        end
    a0 = self._function(r)
    if size(a0) != size(r)
        raise ValueError("Callable must take array and return array of "
                         "the same shape")
    return a0
end

function rbf(x, y, z; radial=nothing, smooth=nothing)
