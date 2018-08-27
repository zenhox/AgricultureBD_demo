package cn.edu.seu.agriculture.exception;

public class DBAccessException extends RuntimeException {

    public DBAccessException(String message){
        super(message);
    }

    public DBAccessException(String errorCode,Throwable throwable){
        super(errorCode,throwable);
    }

}
