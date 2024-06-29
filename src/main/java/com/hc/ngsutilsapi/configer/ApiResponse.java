package com.hc.ngsutilsapi.configer;

public class ApiResponse<T> {
    private T data;
    private int code;
    private String msg;
    private String redirectUrl;

    public ApiResponse(T data, int code, String msg, String redirectUrl) {
        this.data = data;
        this.code = code;
        this.msg = msg;
        this.redirectUrl = redirectUrl;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getmsg() {
        return msg;
    }

    public void setmsg(String msg) {
        this.msg = msg;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    public static <T> ApiResponse<T> ok(T data) {
        return new ApiResponse<>(data, 0, "Success", null);
    }

    public static <T> ApiResponse<T> result404(T data) {
        return new ApiResponse<>(data, 1000, "object does not exist", null);
    }


    public static <T> ApiResponse<T> error(int code, String msg) {
        return new ApiResponse<>(null, code, msg, null);
    }

    public static <T> ApiResponse<T> resultCreateError(String msg) {
        return new ApiResponse<>(null, 10001, msg, null);
    }

    public static <T> ApiResponse<T> resultUpdateError(String msg) {
        return new ApiResponse<>(null, 10002, msg, null);
    }

    public static <T> ApiResponse<T> resultDeleteError(String msg) {
        return new ApiResponse<>(null, 10003, msg, null);
    }

}
