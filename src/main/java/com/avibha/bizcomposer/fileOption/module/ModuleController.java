package com.avibha.bizcomposer.fileOption.module;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author sarfrazmalik
 */
@Controller
public class ModuleController {

    @RequestMapping(value = {"/Module"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String execute(HttpServletRequest request) throws IOException, ServletException {
        String forward = "success";
        String action = request.getParameter("tabid");
        if(action.equalsIgnoreCase("ImportModule")) {
            forward = "/file/moduleImport";
        }
        return forward;

    }
}
