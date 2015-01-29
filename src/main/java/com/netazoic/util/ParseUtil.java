package com.netazoic.util;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Map;

import org.apache.commons.io.FileUtils;

public class ParseUtil {
	public ParseUtil(){}
	public String templatePath;

	public String parseQueryFile(Map<String,Object> settings, String path) throws Exception{
		File rootPath = new File(".");
		//FIXME magic string
		path = rootPath.getCanonicalPath() + "/src/main/webapp/templates" +  File.separator + path;
		String q = readFile(path);
		return parseQuery(settings, q);
	}

	public static String parseQuery(Map<String,Object> settings, String q) throws Exception{

		try {
			String key, val,token;
			Object valObj;
			for(Map.Entry<String,Object> entry: settings.entrySet()){
				key = entry.getKey();
				valObj = entry.getValue();
				val = valObj==null?"null":valObj.toString();
				token = "\\{\\{" + key + "\\}\\}";
				q = q.replaceAll(token, val);
			}
		} catch (Exception ex) {
			throw ex;
		}
		return q;
	}

	static String readFile(String path) throws IOException{
		Charset charset = StandardCharsets.UTF_8;
		return readFile(path,charset);
	}

	static String readFile(String path, Charset encoding) 
			throws IOException 
			{
		byte[] encoded = Files.readAllBytes(Paths.get(path));
		return encoding.decode(ByteBuffer.wrap(encoded)).toString();
			}

	public static String readLargeFile(File file) throws IOException{
		return FileUtils.readFileToString(file);
	}
}
