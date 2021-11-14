doubleUs x y = x * 2 + y * 2
doubleMe x = x + x
doubleUs' x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
                        then x
                        else x * 2
doubleSmallNumber' x = (if x > 100 then x else x *2) + 1
allNumbers (x:xs) = [ q | q <- xs, q > 100] ++ [ y * 2 | y <- xs, y <= 100]
