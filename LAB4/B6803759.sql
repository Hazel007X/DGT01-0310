CREATE DATABASE dbEmployee
ON PRIMARY
(
    NAME = dbEmployee_DAT, 
    FILENAME = 'D:\DGT01_0310\B6803759\',  -- á¡é B6803759 à»ç¹ÃËÑÊµÑÇàÍ§ + â¿Åà´ÍÃì·ÕèÊÃéÒ§¨ÃÔ§
    SIZE = 5,
    MAXSIZE = 20,
    FILEGROWTH = 1
)
LOG ON
(
    NAME = dbEmployee_LOG,
    FILENAME = 'D:\DGT01_0310\B6803759\',  -- á¡éãËéµÃ§¡Ñº¢Í§µÑÇàÍ§àËÁ×Í¹¡Ñ¹
    SIZE = 5,
    MAXSIZE = 5,
    FILEGROWTH = 1

);
