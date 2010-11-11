module FunctionParser where
--Currently not in use. This will hold the future parsec code to parse algebraic fractal formulas

import ParsecExpr

expr = do
    z <- char (symbol 'z')
    symbol "=" 
    e <- char (symbol 'z') <|> number 

infixop s f a = Infix (do {reservedOp s; return f}) a 
prefixop s f = Prefix (do {reservedOp s; return f})
postfixop s f = Postfix (do {reservedOp s; return f})

