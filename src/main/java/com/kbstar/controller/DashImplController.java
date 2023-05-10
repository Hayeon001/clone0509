package com.kbstar.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;


@RestController
public class DashImplController {

    @RequestMapping ("/dashboard01")
    public Object dashboard01(){

        JSONArray ja = new JSONArray();
        for(int i=1; i<=5; i++){
            Random r = new Random();
            int num = r.nextInt(20)+1;
            JSONArray jadata = new JSONArray();
            jadata.add("data : "+num);
            jadata.add(num);
            ja.add(jadata); //배열안에 배열 만들어서 넣고 데이터 쌓기
        };
        return ja;
    }
    @RequestMapping ("/dashboard02")
    public Object dashboard02(){

        JSONObject jo = new JSONObject();

        JSONArray jaCnt = new JSONArray();
        for(int i=1;i<=5; i++){
            Random r = new Random();
            int cnt = r.nextInt(10000)+1;
            jaCnt.add(cnt);
        }
        JSONArray jaYear = new JSONArray();
        for(int i=2021;i<=2023; i++){
            jaYear.add(i);
        }
        jo.put("category",jaYear);
        jo.put("datas",jaCnt);
        return jo;
    }
    @RequestMapping ("/dashboard03")
    public Object dashboard03(){

        JSONArray ja = new JSONArray();
        for(int i=1; i<=30; i++){
            Random r = new Random();
            int num = r.nextInt(1000)+1;
            JSONArray jadata = new JSONArray();
            jadata.add("data : "+num);
            jadata.add(num);
            ja.add(jadata); //배열안에 배열 만들어서 넣고 데이터 쌓기
        };
        return ja;
    }

}






