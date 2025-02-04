package com.zh.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.zh.Entity.ColInfo;
import com.zh.Entity.FinalReport;
import com.zh.Entity.HostHolder;
import com.zh.service.ColInfoService;
import com.zh.service.FinalReportService;
import com.zh.service.OrgService;
import com.zh.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by lqp on 2019/7/29
 */
@Controller
public class ShowReportController {

    @Autowired
    FinalReportService finalReportService;

    @Autowired
    OrgService orgService;

    @Autowired
    ReportService reportService;

    @Autowired
    ColInfoService colInfoService;

    @Autowired
    HostHolder hostHolder;

    @PostMapping("/getColNames")
    @ResponseBody
    public List<ColInfo> getColNames(Integer reportId) {
        List<ColInfo> list = colInfoService.queryColInfo(reportId);
        return list;
    }

    @RequestMapping(value = "/leaderShowFinalReport1", method = {RequestMethod.POST})
    public ModelAndView leaderShowFinalReport1(@RequestParam("reportId") Integer reportId,
                                               @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                                               @RequestParam(value = "pageSize",defaultValue = "500") Integer pageSize) {
        ModelAndView view = new ModelAndView(new MappingJackson2JsonView());
        String[] conInfo = colInfoService.queryExcel(reportId);
        if(conInfo.length==0||conInfo==null){
//            view.addObject("该表没有列！");
            view.addObject("colInfo",null );
            view.addObject("finalreport", null);
            return view;
        }
        else {
            view.addObject("colInfo",conInfo );
        }
        //如果当前用户为普通用户（非团队长），只能查看自己所属团队的报表
        if(hostHolder.getUser().getRoleId()==0){
            String creat_emp = reportService.getCreateEmp(reportId);
            Integer orgId=orgService.selectOrgIdByCreatEmp(creat_emp);
            if(hostHolder.getUser().getOrgId()==orgId){
                PageHelper.startPage(pageNum, pageSize);
                List<FinalReport> reportDatil = finalReportService.getInfoByReportId(reportId,pageNum,pageSize);
                List<String> strs  = listToString(reportDatil,conInfo);
                if (reportDatil.isEmpty()) {
                    view.addObject("finalreport", strs);
//                    view.addObject("该表不存在！");
                    return view;
                } else {
                    view.addObject("finalreport", strs);
                    return view;
                }
            }else {
                view.addObject("您不是该表所属团队的团员，不能查看该报表！");
                return view;
            }
        }
        //如果当前用户为团队长，只能查看自己创建的表
        if (hostHolder.getUser().getRoleId() == 1) {
            //如果这张表为该团队长创建的表
            if (hostHolder.getUser().getEmpId().equals(reportService.getCreateEmp(reportId))) {
                PageHelper.startPage(pageNum, pageSize);
                List<FinalReport> reportDatil = finalReportService.getInfoByReportId(reportId,pageNum,pageSize);
                List<String> strs  = listToString(reportDatil,conInfo);
                if (reportDatil.isEmpty()) {
                    view.addObject("finalreport", strs);
//                    view.addObject("该表不存在！");
                    return view;
                } else {
                    view.addObject("finalreport", strs);
                    return view;
                }
            } else {  //如果该表不是该团队长建的表
                view.addObject("您不是该表的创建者，不能查看该表！");
                return view;
            }
        }
        view.addObject("当前用户角色无效");
        return view;
        //return view;

    }


    @RequestMapping(value = "/leaderShowFinalReport", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> leaderShowFinalReport(@RequestParam("reportId") Integer reportId,
                                                     @RequestParam(value = "page", defaultValue = "1") Integer page,
                                                     @RequestParam(value = "limit", defaultValue = "5") Integer limit) {
        int count = finalReportService.getCount(reportId);
        List<FinalReport> reportDatil = finalReportService.getInfoByReportId(reportId,page,limit);
        JSONArray data = getJSONArrayByList(reportDatil);
        if (data != null) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", 0);
            jsonObject.put("msg", "");
            jsonObject.put("count",count);
            jsonObject.put("data", data);
            return jsonObject;
        }
        return null;

    }

    public static JSONArray getJSONArrayByList(List<?> list) {
        JSONArray jsonArray = new JSONArray();
        if (list == null || list.isEmpty()) {
            return jsonArray;
        }
        for (Object object : list) {
            jsonArray.add(object);
        }
        return jsonArray;
    }

    public List<String> listToString(List<FinalReport> list, String[] conInfo) {
        List<String> finlist = new ArrayList<>();
        StringBuilder sb;
        for (FinalReport fin : list) {
            sb = new StringBuilder();
            for (int i = 1; i <= conInfo.length; i++) {
                Method[] method = FinalReport.class.getMethods();
                for (Method met : method) {
                    if (met.getName().equals("getCol" + i)) {
                        try {
                            String ss = (String) met.invoke(fin);
                            sb.append(ss + "!,");
                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                        } catch (InvocationTargetException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            finlist.add(sb.toString());
        }
        return finlist;
    }


}
