package cn.edu.seu.agriculture.exception;

public class DataNotExistException extends RuntimeException{

    public DataNotExistException(String message){
        super(message);
    }

    public DataNotExistException(String errorCode,Throwable throwable){
        super(errorCode,throwable);
    }
}
