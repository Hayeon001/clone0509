package com.kbstar.controller;

import com.kbstar.dto.Chart;
import com.kbstar.service.ChartService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AjaxImplController {

    @Autowired
    ChartService chartService;
    @RequestMapping("/chart1")
    public Object chart1() throws Exception {
            List<Chart> list = chartService.getMonthlyTotal();
            JSONArray fma = new JSONArray();  //Female array
            JSONArray ma = new JSONArray();
            for(Chart c : list){
                //남자 or 여자
                if(c.getGender().toUpperCase().equals("F")){
                    fma.add(c.getTotal());
                }else{
                    ma.add(c.getTotal());
                }
            }
            JSONObject fmo = new JSONObject();
            JSONObject mo = new JSONObject();
            fmo.put("name","Female");
            fmo.put("data",fma);
            mo.put("name","Male");
            mo.put("data",ma);
            JSONArray data = new JSONArray();
            data.add(fmo);
            data.add(mo);
            return data;

    }


}
