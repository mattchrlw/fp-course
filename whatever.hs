x :: Integer
x = 99

a :: Integer -> Integer
a b = b + 10

-- arrows are right assoc., spaces are left assoc.
f :: Integer -> Integer -> Integer
f i j = (i + j) * 2

-- this is a syntactical difference
ff :: Integer -> Integer -> Integer
ff = \i j -> (i + j) * 2

fff :: Integer -> Integer -> Integer
fff i = \j -> (i + j) * 2

-- a to z are prefix by default
-- use backticks to do infix
-- but for non a-z? infix by default
-- use parentheses to do prefix
(+++) :: Integer -> Integer -> Integer
(+++) i = \j -> (i + j) * 2

-- TwoIntegers' is the constructor name
-- TwoIntegers is the data type name
-- :t TwoIntegers'
-- TwoIntegers' :: Integer -> Integer -> TwoIntegers
-- :t TwoIntegers' 99
-- TwoIntegers' 99 :: Integer -> TwoIntegers
-- :t TwoIntegers' 99 88
-- TwoIntegers' 99 77 :: TwoIntegers

data TwoIntegers = TwoIntegers' Integer Integer
    deriving (Eq, Show)

data TwoAnything a = TwoAnything' a a
    deriving (Eq, Show)

data Shape = 
    Square Integer | 
    Rectangle Integer Integer |
    Triangle Integer Integer Integer |
    Circle Integer
    deriving (Eq, Show)

pie = 3

perimeter :: Shape -> Integer
perimeter (Square x) = x * 4
perimeter (Rectangle x y) = (x + y) * 2
perimeter (Triangle x y z) = x + y + z
perimeter (Circle r) = 2 * pie * r

perimeterAgain :: Shape -> Integer
perimeterAgain = \s -> case s of
    Square x -> x * 4
    Rectangle x y -> (x + y) * 2
    Triangle x y z -> x + y + z
    Circle r -> 2 * pie * r

-- The "rudimentary" workflow
m :: (a -> b) -> TwoAnything a -> TwoAnything b
m = \a -> \b -> case b of
    TwoAnything' a1 a2 -> TwoAnything' (a a1) (a a2)

u :: a -> b -> a
u = \a -> \_ -> a