CREATE DATABASE dbEmployee
ON PRIMARY
(
    NAME = dbEmployee_DAT, 
    FILENAME = 'D:\DGT01_0310\B6803759\',  -- แก้ B6803759 เป็นรหัสตัวเอง + โฟลเดอร์ที่สร้างจริง
    SIZE = 5,
    MAXSIZE = 20,
    FILEGROWTH = 1
)
LOG ON
(
    NAME = dbEmployee_LOG,
    FILENAME = 'D:\DGT01_0310\B6803759\',  -- แก้ให้ตรงกับของตัวเองเหมือนกัน
    SIZE = 5,
    MAXSIZE = 5,
    FILEGROWTH = 1
);