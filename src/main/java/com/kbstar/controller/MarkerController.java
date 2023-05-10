package com.kbstar.controller;

import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerSearch;
import com.kbstar.service.MarkerService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/marker")
public class MarkerController {

    @Autowired
    MarkerService markerService;

    String dir = "marker/";

    @Value("${uploadimgdir}")
    String imgdir;

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Marker marker) throws Exception {  //이름.가격.이미지 가 날아옴
        MultipartFile mf = marker.getMarker_img();
        String imgname = mf.getOriginalFilename();

        marker.setImg(imgname);  //db에 저장
        markerService.register(marker);

        FileUploadUtil.saveFile(mf,imgdir);
        //model.addAttribute("center", dir+"add");
        return "redirect:/marker/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Marker> list = null;
        list = markerService.get();
        model.addAttribute("mlist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Marker marker = null;
        marker = markerService.get(id);
        model.addAttribute("gmarker", marker);  //get marker
        model.addAttribute("center", dir+"detail");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Marker marker) throws Exception {
        MultipartFile mf = marker.getMarker_img();
        String new_imgname = mf.getOriginalFilename();
        if (new_imgname.equals("") || new_imgname == null) {  //새이미지 없을때
            markerService.modify(marker);
        } else {
            marker.setImg(new_imgname);
            markerService.modify(marker);
            FileUploadUtil.saveFile(mf, imgdir);
        }
        return "redirect:/marker/detail?id="+marker.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, int id) throws Exception {
        markerService.remove(id);
        return "redirect:/marker/all";
    }

    @RequestMapping("/search")
    public String search(Model model, MarkerSearch ms) throws Exception {

        List<Marker> list = markerService.search(ms);
        model.addAttribute("ms",ms); //검색하고 결과 나올 때 검색창 지워지지 않도록 다시보내기
        model.addAttribute("mlist",list);
        model.addAttribute("center",dir+"all");
        return "index";
    }
}
