package com.web.common;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class BeanUtilHelper {

	public static <T> void setParam(T t, HttpServletRequest req) {
		try {
			BeanUtils.populate(t, req.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}
