package com.biao.pojo;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

public class Msg {

    private int code;

    private String msg;

    //用户要返回给浏览器的数据
    private Map<String,Object> map = new HashMap<>();

    public static Msg success(){
        Msg res = new Msg();
        res.setCode(100);
        res.setMsg("处理成功");
        return res;
    }

    public static Msg fail(){
        Msg res = new Msg();
        res.setCode(200);
        res.setMsg("处理失败");
        return res;
    }

    public Msg add(String info, Object o) {
        this.getMap().put(info,o);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

}
