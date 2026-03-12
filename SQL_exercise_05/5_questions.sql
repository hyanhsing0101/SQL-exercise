-- https://en.wikibooks.org/wiki/SQL_Exercises/Pieces_and_providers
-- 5.1 Select the name of all the pieces.
    select Name from Pieces;

-- 5.2  Select all the providers' data.
    select * from Providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
    select Piece, avg(Price) from Provides group by Piece;

-- 5.4  Obtain the names of all providers who supply piece 1.
    select Name from Providers join Provides on Providers.Code = Provides.Provider where Provides.Piece = 1;

-- 5.5 Select the name of pieces provided by provider with code "HAL".
    select Name from Pieces join Provides on Pieces.Code = Provides.Piece where Provides.Provider = 'HAL';

-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
-- ---------------------------------------------
    select Pieces.Name, Providers.Name, Provides.Price from Provides
        join Providers on Provides.Provider = Providers.Code
        join Pieces on Provides.Piece = Pieces.Code
        join (select Piece, max(Price) as 'max' from Provides group by Piece) as new on new.max = Provides.Price and new.Piece = provides.Piece
    where new.max is not null;

-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
    insert into Provides (Piece, Provider, Price) VALUES (1, 'TNBC', 7);

-- 5.8 Increase all prices by one cent.
    update Provides set Price = 1 + Price;

-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
    delete from Provides where Provider = 'RBT' and Piece = 4;

-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
    delete from Provides where Provider = 'RBT';
