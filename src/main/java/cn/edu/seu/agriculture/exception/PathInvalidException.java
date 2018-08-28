package cn.edu.seu.agriculture.exception;

public class PathInvalidException extends RuntimeException{

    public PathInvalidException(){
        this("URL path is invalid!");
    }

    public PathInvalidException(String message){
        super(message);
    }
}
