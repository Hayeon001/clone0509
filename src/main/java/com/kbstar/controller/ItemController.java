package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.service.ItemService;
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
@RequestMapping("/item")
public class ItemController {

    @Autowired
    ItemService itemService;

    String dir = "item/";


    @Value("${uploadimgdir}")
    String imgdir;
    //app.proper 에 셋팅된 디렉토리가 여기로 들어간다

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Item item) throws Exception {  //이름.가격.이미지 가 날아옴
        //item.getImg(); //파일덩어리
        MultipartFile mf = item.getImg();
        String imgname = mf.getOriginalFilename(); //파일덩어리에서 이름 꺼내기

        //테스트
        //log.info("-------------------------"); //로그 찍어보려면 @Slf4j 넣고 확인
        //log.info(imgname);

        item.setImgname(imgname);  //db에 저장
        itemService.register(item);  //파일덩어리를 디렉토리에 저장(C:)  -> 순서는 직접 설정

        FileUploadUtil.saveFile(mf,imgdir);
        //model.addAttribute("center", dir+"add");
        return "redirect:/item/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.get();
        model.addAttribute("ilist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Item item = null;
        item = itemService.get(id);
        model.addAttribute("gitem", item);  //get item
        model.addAttribute("center", dir+"detail");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Item item) throws Exception {
        MultipartFile mf = item.getImg();
        String new_imgname = mf.getOriginalFilename();
        //log.info("-------------------------"); //로그 찍어보려면 @Slf4j 넣고 확인
        //log.info(imgname);

        //업데이트할 img가 있을때 없을때

        //방법1
        if(new_imgname.equals("")|| new_imgname == null){  //새이미지 없을때
            itemService.modify(item);
        } else{
            item.setImgname(new_imgname);
            itemService.modify(item);
            FileUploadUtil.saveFile(mf,imgdir);
        }

        //방법2
//        if(!new_imgname.equals("")|| new_imgname != null){
//            item.setImgname(new_imgname);
//            FileUploadUtil.saveFile(mf,imgdir);
//        }
//        itemService.modify(item);

        return "redirect:/item/detail?id="+item.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, int id) throws Exception {
        itemService.remove(id);
        return "redirect:/item/all";
    }


    //search
    @RequestMapping("/search")
    public String search(Model model, ItemSearch ms) throws Exception {
//        log.info("--------------------------------------");
//        log.info(ms.getStartdate());
//        log.info(ms.getEnddate());
//        log.info("--------------------------------------");
        List<Item> list = null;
        list = itemService.search(ms);
        model.addAttribute("ms", ms);
        model.addAttribute("ilist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

}
