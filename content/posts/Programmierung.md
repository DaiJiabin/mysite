---
title: "Programmierung"
date: 2021-05-28T08:58:27+02:00
draft: false
---

## Programmierung, SoSe 2021 (Haskell)

- To the Begin: The most important thing, is __THOUGHT__.

### Grammatik

- Function Definition, to do here

- Branch in Haskell, to do here

  - Simple Format for 2-Branches

### 02. Komposite Typen

- complex type

  `type Triple = (Int, Int, Int)`

  $\rarr$ `addThree :: Triple -> Int`

- `List`

  - `[1,2,3,4]` $\rarr$ `[Int]`
  - `[]` $\rarr$ `[Int]`
  - `[True]` $\rarr$ `[Bool]`
  - `[[1,2],[],[4]]` $\rarr$ `[[Int]]`
  - Usage:

    ```haskell
      sumList :: [Int] -> Int
      sumList [] = 0
      sumList (x : xs) = x + sumList xs
      -- symbol ':' is here constructor, used to pull a single element out.
    ```

  - method `append`
  
    ```haskell
      append :: [Int] -> [Int] -> [Int]
      append [] ys = ys
      append (x : xs) ys = x : append xs ys
    ```

  - insertSort

    ```haskell
      iSort :: [Int] -> [Int]
      iSort [] = []
      iSort (x : xs) = ins x (iSort xs)

      ins :: Int -> [Int] -> [Int]
      ins x [] = [x]
      ins x (y : ys)
        | x <= y = x : y : ys
        | otherwise = y : ins x ys
    ```

- Algebraische Datentypen

  `data Season = Spring | Summer | Autum | Winter`

  ```haskell
    data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun
    isWorkingDay :: Day -> Bool
    isWorkingDay Sat = False
    isWorkingDay Sun = False
    isWorkingDay _ = True
    -- Symbol '_' here is "The Rest"
  ```

  ```haskell
    data Expr = Lit Int
              | Add Expr Expr
              | Sub Expr Expr

    eval :: Expr -> Int
    eval (Lit n) = n
    eval (Add e1 e2) = eval e1 + eval e2
    eval (Sub e1 e2) = eval e1 - eval e2

    height :: Expr -> Int
    height (Lit _) = 1
    height (Add e1 e2) = 1 + max (height e1) (height e2)
    height (Sub e1 e2) = 1 + max (height e1) (height e2)
  ```

### 03. Ordnung

- e.g.

  ```haskell
    map :: (Int -> Int) -> [Int] -> [Int]
    -- (Int -> Int) here is function f
    map f [] = []
    map f (x : xs) = f x : map f xs

    double :: Int -> Int
    double x = 2 * x
  ```

  if we run code above:

  ```haskell
    map double [2, 1, 4]
    = double (2) : map double [1, 4]
    = 4 : double (1) : map double [4]
    = [4, 2] : double (4) : map double []
    = [4, 2, 8] : []
    = [4, 2, 8]
  ```

- Sth advance

  ```haskell
    foldr :: (Int -> Int -> Int) -> Int -> [Int] -> Int
    -- here the function f maps (Int, Int) into Int
    -- e.g., add, sub, etc.
    foldr _ z [] = z
    foldr f z (x : xs) = f x (foldr f z xs)

    sumList :: [Int] -> Int
    sumList xs = foldr (+) 0 xs

    prodList :: [Int] -> Int
    prodList xs = foldr (*) 1 xs
  ```

- filter function

  ```haskell
    filter :: (Int -> Bool) -> [Int] -> [Int]
    filter _ [] = []
    filter p (x : xs)
      | p x = x : filter p xs
      | otherwise = filter p xs

    even :: Int -> Bool
    even x = mod x 2 == 0
  ```

- composition function

  ```haskell
    compose :: (Int -> Int) -> (Int -> Int) -> Int
    compose f g x = f (g x)
  ```

- quickSort

  ```haskell
    qSort :: [Int] -> [Int]
    qSort [] = []
    qSort (x : xs) = qSort (filter (x >) xs) ++ [x] ++ qSort (filter (x <=) xs)
    -- how to, (x >)
  ```

### 04. Typpolymorphie

- i.e.

  ```haskell
    length' :: [Int] -> Int
    length' [] = 0
    length' x : xs = 1 + length' xs

    lenght'' :: [Bool] -> Int
    length'' [] = 0
    length'' (_ : xs) = 1 + length'' xs
  ```

  -> its variant

  ```haskell
    length :: [a] -> Int
    -- we discard the specific type like Int, Bool
    length [] = 0
    length (_ : xs) = 1 + length xs
  ```

#### Tree

```haskell
  data Tree a = Nil | Node a (Tree a) (Tree b)

  height :: Tree a -> Int
  height Nil = 1
  height (Node n t1 t2) = 1 + max (height t1) (height t2)

  collapse :: Tree a -> [a]
  collapse Nil = []
  collapse (Node n t1 t2) = collapse t1 ++ [n] + collapse t2
```

### 05. Strukturellen Induktion

- i.e.

  ```haskell
    sumList :: [Int] -> Int
    sumList [] = 0
    sumList (x : xs) = x + sumList xs
  ```

  ```haskell
    double :: [Int] -> [Int]
    double [] = []
    double (x : xs) = 2 * x : double xs
  ```

  Then please prove: sumList (double xs) = 2 * sumList xs

  - Prove:

    1. __Induktionsanfang: xs = []__

        sumList (double xs)

        = sumList (double [])

        = sumList []

        = 0

        = 2 * 0

        = 2 * (sumList [])

        = 2 * (sumList xs)

    2. __Induktionsvoraussetzung__

        Sei xs' :: [Int]. Wir nehmen an, dass $P(xs')$ gilt.

    3. __Induktionsschritt__

        For xs = x : xs' with x :: Int

        sumList (double xs)

        = sumList (double(x : xs'))

        = sumList ((2 * x) : double xs')

        = (2 * x) + sumList (double xs')

        = (2 * x) + (2 * sunList xs')

        = 2 * (x + sumList xs')

        = 2 * sumList (x : xs')

        = 2 * sumList xs
  
- 25 min, the example of tree is unclear.

- i.e.2

  ```haskell
    map :: (a -> a) -> [a] -> [a]
    map f [] = []
    map f (x : xs) = f x : map f xs
    datat Tree = Nil | Node a (Tree a) (Tree b)
  ```

  ```haskell
    mapTree :: (a -> a) -> Tree a -> Tree a
    mapTree f Nil = Nil
    mapTree f (Node x t1 t2) = Node (f x) (mapTree f t1) (mapTree f t2)
  ```

  ```haskell
    collapse :: Tree a -> [a]
    collapse Nil -> []
    collapse (Node x t1 t2) = collapse t1 ++ [x] ++ collapse t2
  ```

- Summary: Sei P:T -> {0, 1} eine Eigenschaft des algebraischen Datentyps T. Wenn

  - (Induktionsanfang) für jeden Konstruktor D von T, für den kein Argumenttyp gleich T ist, dass Prädikat P gilt

  - (Induktionsschritt) folgende Implikation für jeden k-stelligne Konstruktor C mit Ergebnistzp T mit k >= 1 und alle Werte t1, ... tk gilt: wenn P für jedes t1 vom Tyü T gilt, dann gilt P für (C t1 ... tk).

  Dann gilt P für jeden Wert von T






