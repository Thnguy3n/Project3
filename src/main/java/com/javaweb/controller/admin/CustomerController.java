package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;
import com.javaweb.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller(value="customerControllerOfAdmin")
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;
    @Autowired
    private TransactionService transactionService;
    @Autowired
    private MessageUtils messageUtil;


    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(CustomerSearchRequest customerSearchRequest,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("listStaffs",userService.getStaffs());
        mav.addObject("modelSearchs",customerSearchRequest);
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId=SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
            mav.addObject("customers",customerService.findAll(customerSearchRequest));
        }
        else {
            mav.addObject("customers",customerService.findAll(customerSearchRequest));
        }
        CustomerSearchResponse response = new CustomerSearchResponse();
        DisplayTagUtils.of(request, response);
        List<CustomerSearchResponse> customerSearchResponses = customerService.getAllCustomer(new PageRequest(response.getPage() -1, response.getMaxPageItems()));
        response.setListResult(customerSearchResponses);
        response.setTotalItems(customerService.findAll(customerSearchRequest).size());
        mav.addObject(SystemConstant.MODEL,response);
        initMessageResponse(mav,request);
        return mav;
    }
    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(@ModelAttribute("customerEdit")CustomerDTO customerDTO,HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        return mav;
    }
//    @RequestMapping(value = "/lien-he", method = RequestMethod.GET)
//    public ModelAndView customerAdd(@ModelAttribute("customerAdd")CustomerDTO customerDTO, HttpServletRequest request){
//        ModelAndView mav = new ModelAndView("web/contact");
//        return mav;
//    }
    @RequestMapping(value = "/admin/customer-edit-{id}", method = RequestMethod.GET)
    public ModelAndView customerEdit(@PathVariable("id")Long Id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO= customerService.findCustomerEntityById(Id);
        mav.addObject("customerEdit",customerDTO);
        mav.addObject("transactionType", TransactionType.transactionType());
        mav.addObject("ListType1",transactionService.addTransactions(Id,"CSKH"));
        mav.addObject("ListType2",transactionService.addTransactions(Id,"DDX"));
        return mav;
    }

    private void initMessageResponse(ModelAndView mav, HttpServletRequest request) {
        String message = request.getParameter("message");
        if (message != null && StringUtils.isNotEmpty(message)) {
            Map<String, String> messageMap = messageUtil.getMessage(message);
            mav.addObject(SystemConstant.ALERT, messageMap.get(SystemConstant.ALERT));
            mav.addObject(SystemConstant.MESSAGE_RESPONSE, messageMap.get(SystemConstant.MESSAGE_RESPONSE));
        }
    }



}
