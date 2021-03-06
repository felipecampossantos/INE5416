data Forma =
    Circulo Float
    | Retangulo Float Float
    | Triangulo Float Float Float
    
area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a
area (Triangulo a b c)
    | a == b && b == c = (c * c) * ((sqrt 3)/4.0)  -- triangulo equilatero
    | a*a + b*b == c*c = (a*b)/2                   -- triangulo retangulo
    | c*c + b*b == a*a = (c*b)/2                   -- triangulo retangulo
    | a*a + c*c == b*b = (a*c)/2                   -- triangulo retangulo
    | a == b && a /= c = (getAltura a (c/2))*c/2   -- triangulo isosceles
    | a == c && a /= b = (getAltura a (b/2))*b/2   -- triangulo isosceles
    | b == c && c /= a = (getAltura b (a/2))*a/2   -- triangulo isosceles
    | a /= b && b /= c = sqrt((getSemiPerimetro a b c)*((getSemiPerimetro a b c)-a)*((getSemiPerimetro a b c)-b)*((getSemiPerimetro a b c)-c))  -- triangulo escaleno (formula de herao)

getSemiPerimetro :: Float -> Float -> Float -> Float
getSemiPerimetro a b c = (a+b+c)/2

getAltura :: Float -> Float -> Float
getAltura a b
    | a > b = sqrt(a*a - b*b)
    | a < b = sqrt(b*b - a*a)
    | a==b = sqrt(a*a - b*b)

minhaForma :: Forma
minhaForma = (Triangulo 4 4 4)

main = do
    --putStrLn ( show (area (Circulo 6.42)) )
    --putStrLn ( show (area (Retangulo 4 5)) )
    --putStrLn ( show (area minhaForma) )
    
    let triRetangulo = (Triangulo 3 4 5)
    let triIsosceles = (Triangulo 10 10 12)
    let triEscaleno = (Triangulo 5 7 8)
    let triEquilatero = (Triangulo 10 10 10)
    
    --putStrLn ( show (area triRetangulo) )
    --putStrLn ( show (area triIsosceles) )
    --putStrLn ( show (area triEscaleno) )
    putStrLn ( show (area triEquilatero) )
    