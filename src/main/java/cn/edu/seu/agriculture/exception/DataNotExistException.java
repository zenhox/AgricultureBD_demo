package cn.edu.seu.agriculture.exception;

import java.util.Date;

public class DataNotExistException extends RuntimeException{

    public DataNotExistException(){
        this("Data not exist in database!");
    }
    public DataNotExistException(String message)
    {
        super(message);
    }
}
