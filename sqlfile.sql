CREATE TABLE [dbo].[Tables] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [Number] INT NOT NULL,
    [Capacity] INT NOT NULL,
    [Status] NVARCHAR(20) NOT NULL DEFAULT 'Vacant' CHECK (Status IN ('Vacant', 'Occupied', 'Reserved'))
);


-- Table for storing food items
CREATE TABLE FoodItems (
    FoodItemId INT PRIMARY KEY,
    Name VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Table for storing orders
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    TableId INT,
    FoodItemId INT,
    Quantity INT,
    OrderStatus VARCHAR(20), -- Pending, Completed, Cancelled
    FOREIGN KEY (TableId) REFERENCES Tables(Id),
    FOREIGN KEY (FoodItemId) REFERENCES FoodItems(FoodItemId)
);
