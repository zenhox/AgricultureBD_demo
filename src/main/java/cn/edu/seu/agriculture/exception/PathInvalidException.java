package cn.edu.seu.agriculture.exception;

public class PathInvalidException extends RuntimeException{

    public PathInvalidException(String message){
        super(message);
    }

    public PathInvalidException(String errorCode,Throwable throwable){
        super(errorCode,throwable);
    }

}
