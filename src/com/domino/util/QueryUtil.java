package com.domino.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class QueryUtil {

	private static Map<String, Properties> queryMap = new HashMap<String, Properties>();

	static {
		try {
			String packageName = QueryUtil.class.getPackage().getName();
			URL root = Thread.currentThread().getContextClassLoader().getResource(packageName.replace(".", "/"));

			addProperties(getFiles(root));
		} catch (Exception e) {
			throw new RuntimeException("SQL Properties File Not Found!");
		}
	}

	private static File[] getFiles(URL root) {
		return new File(root.getFile()).listFiles(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				return name.endsWith(".properties");
			}
		});
	}

	private static void addProperties(File[] files) throws IOException {
		for (File file : files) {
			String key = file.getName().substring(0, file.getName().indexOf("."));
			Properties prop = new Properties();
			prop.load(new FileInputStream(file));

			queryMap.put(key, prop);
		}
	}

	public static String getSQL(String name) {
		String key = name.substring(0, name.indexOf("."));
		Properties prop = queryMap.get(key);
		if (prop == null) {
			throw new RuntimeException("Invalid Query name!");
		}

		String sql = prop.getProperty(name);
		if (sql == null) {
			throw new RuntimeException("Invalid Query name!");
		}
		return sql;
	}
}
