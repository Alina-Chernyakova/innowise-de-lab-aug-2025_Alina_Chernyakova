CREATE TABLE Dim_Date (
    date_sk INT NOT NULL PRIMARY KEY,
    source_data_id DATE NOT NULL UNIQUE,
    day_of_week VARCHAR(15) NOT NULL,
    month VARCHAR(15) NOT NULL,
    is_it_holiday VARCHAR(3) NOT NULL,
    season VARCHAR(10) NULL
);
CREATE TABLE Dim_Table (
    table_sk INT NOT NULL PRIMARY KEY,
    source_table_id INT NOT NULL,
    number INT NOT NULL,
    zone VARCHAR(50) NOT NULL,
    count_of_people INT NOT NULL,
    CONSTRAINT unique_table_zone UNIQUE (source_table_id, zone)
);
CREATE TABLE Dim_Time (
    time_sk INT  NOT NULL PRIMARY KEY,
    source_time_id TIME NOT NULL UNIQUE,
    part_of_day VARCHAR(30) NOT NULL
);
CREATE TABLE Dim_Client (
    client_sk INT NOT NULL PRIMARY KEY,
    source_client_id INT NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL UNIQUE
);
CREATE TABLE Dim_Staff (
    staff_sk INT NOT NULL PRIMARY KEY,
    source_staff_id INT NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
CREATE TABLE Fact_Booking (
    fact_booking_id INT NOT null PRIMARY key,
    date_sk INT NOT NULL,
    time_sk INT NOT NULL,
    table_sk INT NOT NULL,
    client_sk INT NOT NULL,
    staff_sk INT NOT NULL,
    booking_period INT NULL,
    client_count INT NOT NULL ,
    status VARCHAR(10) NOT null ,
    deposit DECIMAL(10,2) NULL DEFAULT 0,
   
    CONSTRAINT FK_FactBooking_DimDate FOREIGN KEY (date_sk) --это все нужно для определения внешних ключей(наверное, надо указывать)
        REFERENCES Dim_Date(date_sk),
    CONSTRAINT FK_FactBooking_DimTime FOREIGN KEY (time_sk) 
        REFERENCES Dim_Time(time_sk),
    CONSTRAINT FK_FactBooking_DimTable FOREIGN KEY (table_sk) 
        REFERENCES Dim_Table(table_sk),
    CONSTRAINT FK_FactBooking_DimClient FOREIGN KEY (client_sk) 
        REFERENCES Dim_Client(client_sk),
    CONSTRAINT FK_FactBooking_DimStaff FOREIGN KEY (staff_sk) 
        REFERENCES Dim_Staff(staff_sk)
);