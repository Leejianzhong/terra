
terra bar(a : int, b : int) : int
    return a + b
end
terra foo(a : int,b : int) : int
    return bar(a,b) + 1
end

terra baz(a : int, b : int) : int
    var f,c,d = 4,baz2(a,b)
    return f + c + d
end and
terra baz2(a : int, b : int) : {int, int}
    return a + 1, b + 2
end

terra two(a : int, b : int) : int
    return a + b
end
terra baz3() : int
    return two(baz2(1,2))
end
terra baz4() : int
    return two(5,(baz2(1,2)))
end

terra baz5()
    return 1,2,baz2(0,0)
end

terra baz6()
    var a,b,c,d = baz5()
    var e = (baz5())
    return a + b + c + d + e
end

terra baz7(a : int)
    if a < 3 then
        return 1,(baz5())
    else
        return 100,2
    end
end
local test = require("test")

test.eq(foo(2,3),6)
test.eq(baz(1,2),10)
test.eq(baz3(),6)
test.eq(baz4(),7)
test.eq(baz6(),7)
test.eq(baz7(10),100)