package com.fanlun.service;

import com.fanlun.bean.Course;
import com.fanlun.dao.KechengDao;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class KechengService {

    @Autowired
    private KechengDao kechengDao;

    public List<Map<String, Object>> queryKecheng() {
        List<Integer> cnos = kechengDao.queryKecheng();

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        for (int cno : cnos) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("cno_key", cno);
            map.put("cno_value", cno);
            list.add(map);
        }
        return list;
    }

    public List<Course> insertCourseByXLS(MultipartFile mFile, String root) {
        List<Course> courseLists = new ArrayList<Course>();
        String originalFileName = mFile.getOriginalFilename();
        String suffix = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        String ym = new SimpleDateFormat("YYYY-MM").format(new Date());
        String filePath = "uploadFile/" + ym + originalFileName;

        try {
            File file = new File(root + filePath);

            if (file.exists()) {
                file.delete();
                file.mkdirs();
            } else {
                file.mkdirs();
            }
            //内存文件写入磁盘中
            mFile.transferTo(file);

            if ("xls".equals(suffix) || "XLS".equals(suffix)) {
                //获取excel文件中数据条并封装成  course的list
                courseLists = importXLS(file);

                System.out.println(courseLists);

                //将 courseLists 数据集合 批量 插入数据库
                int count = kechengDao.insertCourse(courseLists);

                System.out.println("插入 " + count + " 条 课程数据");

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }

        return courseLists;
    }

    /*
        核心部分： 解析XLS文件
     */
    private List<Course> importXLS(File file) {
        List<Course> courseList = new ArrayList<Course>();
        InputStream inputStream = null;
        HSSFWorkbook workbook = null;
        try {
            inputStream = new FileInputStream(file);
            workbook = new HSSFWorkbook(inputStream);

            HSSFSheet sheet = workbook.getSheetAt(0);

            if (sheet != null) {
                for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
                    Course course = new Course();
                    HSSFRow row = sheet.getRow(i);

                    HSSFCell cnoCell = row.getCell(0);
                    int cno = (int) cnoCell.getNumericCellValue();
                    course.setCno(cno);
                    HSSFCell cnCell = row.getCell(1);
                    String cn = cnCell.getStringCellValue();
                    course.setCn(cn);

                    courseList.add(course);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return courseList;
    }
}
