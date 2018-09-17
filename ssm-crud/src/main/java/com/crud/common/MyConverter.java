package com.crud.common;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyConverter implements Converter<String,Date>  {
    private static SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public Date convert(String source) {//"2018-09-11"  -->
        if(source!=null && source.trim().length()>0){
            try {
                return dataFormat.parse(source.trim());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
