package com.fanlun.utils;

/**
 * Author:     反轮
 * Created in: 2017/11/26 15:32
 * Description:
 */
public class StringUtil {
    public static boolean isEmpty(String str){
        if("".equals(str)|| str==null){
            return true;
        }else{
            return false;
        }
    }

    public static boolean isNotEmpty(String str){
        if(!"".equals(str)&&str!=null){
            return true;
        }else{
            return false;
        }
    }
}
