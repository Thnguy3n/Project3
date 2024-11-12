package com.javaweb.controller.web;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.utils.DistrictCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;



@Controller(value = "homeControllerOfWeb")
public class HomeController {
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private BuildingRepository buildingRepository;
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/home");
        BuildingDTO buildingDTO = new BuildingDTO();
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("buildingNoiBat", buildingService.getBuildingLevel1(buildingDTO));
        mav.addObject("buildingMoiNhat", buildingService.getBuildingLevel2(buildingDTO));
        mav.addObject("districts", DistrictCode.type());
		return mav;
	}

    @GetMapping(value="/gioi-thieu")
    public ModelAndView introducceBuiding(){
        ModelAndView mav = new ModelAndView("web/introduce");
        return mav;
    }

    @RequestMapping(value="/chi-tiet-{id}",method = RequestMethod.GET)
    public ModelAndView buildingDetails(@PathVariable("id") Long id , HttpServletRequest request){
        ModelAndView mav = new ModelAndView("web/buildingDetail");
        BuildingDTO buildingDTO = buildingService.findBuildingEntityById(id);
        mav.addObject("BuildingDTO", buildingDTO);
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }


    @GetMapping(value="/san-pham")
    public ModelAndView buidingList(@ModelAttribute BuildingDTO buildingDTO){
        ModelAndView mav = new ModelAndView("/web/list");
        mav.addObject("buildingList",buildingService.getBuilding(buildingDTO));
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

    @GetMapping(value="/tin-tuc")
    public ModelAndView news(){
        ModelAndView mav = new ModelAndView("/web/news");
        return mav;
    }

    @GetMapping(value="/lien-he")
    public ModelAndView contact(){
        ModelAndView mav = new ModelAndView("/web/contact");
        return mav;
    }

    @RequestMapping(value = "/dang-bai", method =RequestMethod.GET)
    public ModelAndView addPost(@ModelAttribute("buildingEdit")BuildingDTO buildingDTO,HttpServletRequest request){
        ModelAndView mav = new ModelAndView("web/addPost");
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
        ModelAndView mav = new ModelAndView("register");
        return mav;
    }

	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/login?accessDenied");
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
}
