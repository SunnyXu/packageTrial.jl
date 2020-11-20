"""
    my_f(x,y)

Returns double the number 'x' plus triple the number 'y'.

"""
function my_f(x, y)
    return 2x + 3y
end

"""
    my_f_add(x,y)

Returns double the number 'x' plus double the number 'y'.

"""
function my_f_add(x, y)
    return 2x + 2y
end


"""
    add_exported(x, y)

Dummy function, exported

# Examples
```jldoctest
julia> add_exported(1, 2)
3
```
"""
function add_exported(x::Number, y::Number)
    return x + y
end

"""
    add_not_exported(x, y)

Dummy function, not exported

# Examples
```jldoctest
julia> packageTrial.add_not_exported(1, 2)
3
```
"""
function add_not_exported(x::Number, y::Number)
    return x + y
end
