package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MainController {

    @Value("${adminserver}")
    String adminserver;

    @Autowired
    private BCryptPasswordEncoder encoder;
    //암호화

    @Autowired
    AdmService admService;

    @RequestMapping("/")   //center ip주소 연결
    public String main(Model model){
        model.addAttribute("adminserver", adminserver);
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }

    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession session){
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/adminfo")
    public String adminfo(Model model, String id) throws Exception {
        Adm adm = null;
        try {
            adm = admService.get(id);
        } catch (Exception e) {
            throw new Exception("시스템장애");
        }
        model.addAttribute("adminfo",adm);
        model.addAttribute("center","adminfo");
        return "index";
    }

    @RequestMapping("/adminfoimpl")
    public String adminfoimpl(Model model, Adm adm) throws Exception {
        try {
            log.info("-------------------------------------" +adm.getPwd());
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.modify(adm);
        } catch (Exception e) {
            throw new Exception("시스템장애");
        }
        return "redirect:/adminfo?id="+adm.getId();
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd,
                            HttpSession session) throws Exception {
        Adm adm = null;
        String nextPage = "loginfail";
        try {
            adm =admService.get(id);
            if(adm != null && encoder.matches(pwd, adm.getPwd())){
                nextPage = "loginok";
                session.setMaxInactiveInterval(100000); //로그인유지시간
                session.setAttribute("loginadm",adm);

            }
        } catch (Exception e) {
            throw new Exception("시스템 장애 : 잠시 후 다시 로그인 하세요");
        }

        model.addAttribute("center",nextPage);
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center","register");
        return "index";
    }
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               Adm adm, HttpSession session) throws Exception {
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            //화면에서 입력된 암호를 가져와서 암호화 후 다시 암호로 집어넣는다
            admService.register(adm);
            session.setAttribute("loginadm",adm);
        } catch (Exception e) {
            throw new Exception("가입오류");
        }
        //logger.info("----------------"+ adm.toString());
        model.addAttribute("radm", adm);
        //model.addAttribute("center","registerok");
        return "redirect:/";
    }


    @RequestMapping("/charts")
    public String charts(Model model){
        model.addAttribute("center","charts");
        return "index";
    }

    @RequestMapping("/tables")
    public String tables(Model model){
        model.addAttribute("center","tables");
        return "index";
    }

    @RequestMapping("/dashboard")
    public String dashboard(Model model){
        model.addAttribute("center","dashboard");
        return "index";
    }
    @RequestMapping("/livechart")
    public String livechart(Model model) {
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "livechart");
        return "index";
    }


    @RequestMapping("/websocket")
    public String websocket(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center","websocket");
        return "index";
    }




}
