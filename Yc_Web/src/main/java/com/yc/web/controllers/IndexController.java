package com.yc.web.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.nio.channels.FileChannel;
import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.jdbc.Connection;
import com.yc.utils.PropertiesUtil;

@Controller
public class IndexController {
	// 去后台登录
	@RequestMapping(value = "/tobacklogin")
	public String tobacklogin() {
		return "backjsp/backlogin";
	}

	// 去后台主页
	@RequestMapping(value = "/tobackmain")
	public String tobackmain() {
		return "backjsp/backmain";
	}

	// 去前台主页
	@RequestMapping(value = "/toindex")
	public String toindex() {
		return "jsp/about";
	}

	// 去数据字典footer
	@RequestMapping(value = "toDataDictionaryFooter")
	public String toDataDictionaryFooter() {
		return "backjsp/datadictionary/footer";
	}

	// 去数据字典description
	@RequestMapping(value = "toDataDictionaryDescription")
	public String toDataDictionaryDescription() {
		return "backjsp/datadictionary/description";
	}

	// 去数据字典logo
	@RequestMapping(value = "toDataDictionaryLogo")
	public String toDataDictionaryLogo() {
		return "backjsp/datadictionary/logo";
	}

	// 去行业新闻
	@RequestMapping(value = "/toinews")
	public String toinews() {
		return "backjsp/news/inews";
	}

	// 去公司新闻
	@RequestMapping(value = "/tocompanynews")
	public String tocompanynew() {
		return "backjsp/news/companynews";
	}

	// 去管理员
	@RequestMapping(value = "/toadmin")
	public String toadmin() {
		return "backjsp/sys/admins/admin";
	}

	// 去人才招聘后台 应聘信息
	@RequestMapping(value = "/tojob")
	public String tojob() {
		return "backjsp/applyseekjobs/job";
	}

	// 去人才招聘后台 招聘信息
	@RequestMapping(value = "/toapply")
	public String toapply() {
		return "backjsp/applyseekjobs/apply";
	}

	// 去人才招聘后台 方向信息
	@RequestMapping(value = "/tojobtype")
	public String tojobtype() {
		return "backjsp/applyseekjobs/jobtype";
	}

	// 去人才招聘后台 方向信息
	@RequestMapping(value = "/toadministrator")
	public String toadministrator() {
		return "backjsp/applyseekjobs/administrator";
	}

	// 去学员项目
	@RequestMapping(value = "/toprojects")
	public String toprojects() {
		System.out.println("学员项目");
		return "backjsp/projects/projects";
	}

	// 去学员就业
	@RequestMapping(value = "/tojobdetails")
	public String toemploy() {
		System.out.println("进来了");
		return "backjsp/projects/jobdetails";
	}

	// 去课程体系管理
	@RequestMapping(value = "/tocoursys")
	public String tocoursys() {
		return "backjsp/coursys/coursys";

	}

	// 去公司活动
	@RequestMapping(value = "/toactivities")
	public String toactivities() {
		return "backjsp/activities/activities";
	}

	// 去公司介绍
	@RequestMapping(value = "/tocompany")
	public String tocompany() {
		return "backjsp/activities/company";
	}

	// 去公司历史
	@RequestMapping(value = "/tohistory")
	public String tohistory() {
		return "backjsp/activities/history";
	}

	// 去查看日志
	@RequestMapping(value = "/tolog")
	public String findlog() {
		return "backjsp/sys/logs/log";
	}

	// 查看日志
	@RequestMapping(value = "/tologs", produces = { "application/json;charset=UTF-8" })
	public void tologs(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException {
		response.setContentType("application/octet-stream");
		String date = request.getParameter("date");
		Properties p = PropertiesUtil.readProperties("log4j.properties");
		String logsBasePath = p.getProperty("log4j.appender.file.File");
		logsBasePath = logsBasePath.substring(25);
		String paths = Class.forName(this.getClass().getName()).getResource("/").getPath();
		int index = Integer.parseInt(
				"" + Class.forName(this.getClass().getName()).getResource("/").getPath().indexOf("webapps")) + 7;
		paths = paths.substring(1, index);
		String path = paths + "/" + logsBasePath;
		if (date != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String time = sdf.format(new Date());
			if (date.equals(time)) {
				path = path;
			} else {
				path = path + "." + date;
			}
		}
		// path=Class.forName(this.getClass().getName()).getResource("/").getPath();
		// path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+logsBasePath;
		// path是指欲下载的文件的路径。
		try {
			// File file = new File(path);
			// 取得文件名。
			// String filename = file.getName();
			// 取得文件的后缀名。
			// System.out.println(filename);
			// String ext = filename.substring(filename.lastIndexOf(".") +
			// 1).toUpperCase();
			FileInputStream inputStream1 = new FileInputStream(path);
			ServletOutputStream out = response.getOutputStream();
			int b = 0;
			byte[] buffer = new byte[1024 * 1024];
			while (b != -1) {
				b = inputStream1.read(buffer);
				out.write(buffer, 0, b);
			}
			inputStream1.close();
			out.close();
			out.flush();
		} catch (Exception e) {
			response.getOutputStream().print(0);
		}
	}

	// 去备份还原数据库
	@RequestMapping(value = "/tobackupdatabase")
	public String todatabase() {
		return "backjsp/backupandload/database/database";
	}

	// 备份数据库
	@RequestMapping(value = "/backupdatabase")
	public void backupdatabase(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 数据库导出
		String path = request.getParameter("path");
		String filename = request.getParameter("file");
		String filepath = path + "//" + filename;
		Properties p = PropertiesUtil.readProperties("db.properties");
		String user = p.getProperty("jdbc.username"); // 数据库帐号
		String password = p.getProperty("jdbc.password"); // 登陆密码
		String data[] = p.getProperty("jdbc.url").split(":");
		int index = data[3].indexOf("/");
		int end = data[3].indexOf("?");
		String database = data[3].substring(index + 1, end); // 需要备份的数据库名
		// TODO:备份的路径地址 因为mysqldump安装路径下面有空格 所以把它拿出来放在D盘
		String stmt1 = "cmd /C d:\\mysqldump " + " -u" + user + " -p" + password + " " + database + " >> " + filepath;
		try {
			Runtime.getRuntime().exec(stmt1);
			System.out.println("数据已导出到文件" + filepath + "中");
			response.getOutputStream().print(1);
		} catch (IOException e) {
			response.getOutputStream().print(0);
		}
	}

	
	//TODO: 未实验 不知道是否正确 还原MySql数据库
	@RequestMapping(value = "/loaddatabase")
	public void loaddatabase(HttpServletRequest request, HttpServletResponse response) throws IOException {
		{
			String filepath = request.getParameter("path");
			// String filename=request.getParameter("file");
			// String filepath=path+"//"+filename;
			Properties p = PropertiesUtil.readProperties("db.properties");
			String user = p.getProperty("jdbc.username"); // 数据库帐号
			String password = p.getProperty("jdbc.password"); // 登陆密码
			String data[] = p.getProperty("jdbc.url").split(":");
			int index = data[3].indexOf("/");
			int end = data[3].indexOf("?");
			String database = data[3].substring(index + 1, end); // 需要备份的数据库名
			InputStream input = new FileInputStream(filepath);
			// String command="cmd/c"+mysqlBinPath+"mysql -u"+user+"
			// -p"+password+""+database;
			// 新建数据库test
			String stmt1 = "mysqladmin -u" + user + " -p" + password + " create" + database;
			String stmt2 = "mysql -u" + user + " -p" + password + " " + database + " < " + filepath;
			String[] cmd = { "cmd", "/c", stmt2 };

			try {
				Runtime.getRuntime().exec(stmt1);
				Runtime.getRuntime().exec(cmd);
				System.out.println("数据已从 " + filepath + " 导入到数据库中");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}


	// 去备份还原文件
	@RequestMapping(value = "/tofile")
	public String tofile() {
		return "backjsp/backupandload/file/file";
	}
	 private static ArrayList<String> filedirlist = new ArrayList<String>();
	 private static ArrayList<String> filelist=new ArrayList<String>();
	// 去备份日志文件
	@RequestMapping(value = "/backuplog")
	public void backfile(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException {
		// templateFile 需要备份的函数
		// srcFile是模板文件 也就是原来的log文件 找到它的绝对路径
		String backpath = request.getParameter("path");
		Properties p = PropertiesUtil.readProperties("log4j.properties");
		String templateFile = p.getProperty("log4j.appender.file.File");
		String name = templateFile.substring(25);
		String logsBasePath=name.split("/")[0];
		String paths = Class.forName(this.getClass().getName()).getResource("/").getPath();
		int index = Integer.parseInt(
				"" + Class.forName(this.getClass().getName()).getResource("/").getPath().indexOf("webapps")) + 7;
		paths = paths.substring(1, index);
		String path = paths + "/" + logsBasePath;
		 filelist=new ArrayList<String>();
		getFiles(path);
		System.out.println(filelist);
		 File backUpFilemkdir = new File(backpath + "/" + logsBasePath);
			backUpFilemkdir.mkdir();
		int indexs=filelist.get(0).indexOf("webapps")+7+logsBasePath.length()+1;
		 for(int i=0;i<filelist.size();i++){
			 System.out.println(filelist.get(i));
			String somepath=filelist.get(i);
			String newname=somepath.substring(indexs+1,somepath.length());
				File srcFile = new File(somepath);
				if (!srcFile.exists()&& !srcFile .isDirectory()) {
					System.out.println("模板文件不存在");
					response.getOutputStream().print(0);
				}
		// 创建备份文件
		// 在原文件的路径下，创建备份文件，命名为 原文件名.bak 15 public static String BACKUP_SUFFIX
		// =".bak";
		String newpaths=backpath+"/"+logsBasePath+"/"+newname;
		try {
			File backUpFile=new File(newpaths);
			if(backUpFile.exists()){
				backUpFile.delete();
			}
			if(backUpFile.createNewFile()) {
				// 创建备份文件成功，进行文件复制
				 fileChannelCopy(srcFile, backUpFile);
			}
		} catch (Exception e) {
			response.getOutputStream().print(0);
			System.out.println("备份文件失败");
		}}
		response.getOutputStream().print(1);
	}
	//去备份图片文件
	@RequestMapping(value = "/backuppic")
	public void backpic(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException {
		// templateFile 需要备份的函数
		// srcFile是模板文件 也就是原来的log文件 找到它的绝对路径
		String backpath = request.getParameter("path");
		Properties p = PropertiesUtil.readProperties("file.properties");
		String templateFile = p.getProperty("picRootName");//图片文件夹名
		String paths = Class.forName(this.getClass().getName()).getResource("/").getPath();
		int index = Integer.parseInt(
				"" + Class.forName(this.getClass().getName()).getResource("/").getPath().indexOf("webapps")) + 7;
		paths = paths.substring(1, index);
		String path = paths + "/" + templateFile;//服务器下图片路径
		 filelist=new ArrayList<String>();
		 filedirlist=new ArrayList<String>();
		getFiles(path);
			File backUpFile=new File(backpath+"/"+templateFile);
			backUpFile.mkdir();
			//创建文件夹
       for(int j=0;j<filedirlist.size();j++){
   		int indexs=filedirlist.get(j).indexOf("webapps")+7;
		String newpaths=filedirlist.get(j).substring(indexs, filedirlist.get(j).length());
			File backUp=new File(backpath+"/"+newpaths);
			  if (!backUp.getParentFile().exists()) {  
	                backUp.getParentFile().mkdirs();  
	            }else{
	            	backUp.mkdir();
	            }
       }
       //创建及备份文件
        for(int i=0;i<filelist.size();i++){
        	String filelistpath=filelist.get(i);
       		File filelists=new File(filelistpath);
       		int indexs=filelist.get(i).indexOf("webapps")+7;
       		String newpaths=filelist.get(i).substring(indexs, filelist.get(i).length());
       	try{
       		File backUpfile=new File(backpath+"/"+newpaths);
       		if(backUpfile.exists()){
       			backUpfile.delete();
			}
			if (backUpfile.createNewFile()) {
				// 创建备份文件成功，进行文件复制
				 fileChannelCopy(filelists, backUpfile);
			}
    	} catch (Exception e) {
			response.getOutputStream().print(0);
			System.out.println("备份文件失败");
		}}
        
        response.getOutputStream().print(1);
        }
	//TODO：还原日志图片文件 因为若是要还原某一个文件对于使用者太麻烦 所以根据日期还原 或全部还原  如果用于上线项目该方法无效  需要修改
	@RequestMapping(value = "/loadlog")
	public void loadlog(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException {
		// templateFile 需要备份的函数
		// srcFile是模板文件 也就是原来的log文件 找到它的绝对路径  这是需要备份的现在反过来
		String backpath = request.getParameter("path");//服务器下的文件 srcFile
		String date=request.getParameter("date");
		Properties p = PropertiesUtil.readProperties("log4j.properties");
		String templateFile = p.getProperty("log4j.appender.file.File");
		String name = templateFile.substring(25);//logs/yc.log
		String logsBasePath=name.split("/")[0];//logs 找到了文件夹名
		//判断文件夹下是否有以该日期结尾的日志文件  判断日期是否为系统日期 
		String path=backpath+"/"+logsBasePath;//D:/logs
			String paths = Class.forName(this.getClass().getName()).getResource("/").getPath();
		int index = Integer.parseInt(
				"" + Class.forName(this.getClass().getName()).getResource("/").getPath().indexOf("webapps")) + 7;
		paths = paths.substring(1, index);
		 filelist=new ArrayList<String>();
			getFiles(path);
		File backUpFilemkdir = new File(paths + "/" + logsBasePath);
			backUpFilemkdir.mkdir();
			 int indexs=filelist.get(0).indexOf("D")+logsBasePath.length()+3;
			 String newname;
			 String somepath = null;
			 if(date!=null&&!date.equals("")){
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String time = sdf.format(new Date());
					//TODO:当天生成的日志文件无法还原  因为它没有日期后缀 无法判断备份的文件是哪天备份的  这是一个bug
					if (date.equals(time)) {
						response.getOutputStream().print(4);
					}else{
						somepath=backpath+"/"+name+"."+date;
					newname=somepath.substring(indexs+1,somepath.length());
			 File srcFile=new File(somepath);
			 if (srcFile.exists()) {
				 String newpaths=paths + "/" + logsBasePath+"/"+newname;
				 try {
				 File backUpFile=new File(newpaths);
					if (backUpFile.createNewFile()) {
						// 创建备份文件成功，进行文件复制
						 fileChannelCopy(srcFile, backUpFile);
					}
				 } catch (Exception e) {
						response.getOutputStream().print(0);
						System.out.println("还原文件失败");
					}
				 response.getOutputStream().print(1);
					
				}else if(!srcFile.exists()&& !srcFile .isDirectory()){
					response.getOutputStream().print(3);
				}
			 }}else{
			 for(int j=0;j<filelist.size();j++){
			 somepath=filelist.get(j);
			System.out.println(somepath);
			 newname=somepath.substring(indexs+1,somepath.length());
			System.out.println(newname);
				File srcFile = new File(somepath);
				if (!srcFile.exists()&& !srcFile .isDirectory()) {
					System.out.println("模板文件不存在");
					response.getOutputStream().print(0);
				}
		// 创建备份文件
		// 在原文件的路径下，创建备份文件，命名为 原文件名.bak 15 public static String BACKUP_SUFFIX
		// =".bak";
		String newpaths=paths + "/" + logsBasePath+"/"+newname;
		try {
			File backUpFile=new File(newpaths);
			if (backUpFile.createNewFile()) {
				// 创建备份文件成功，进行文件复制
				 fileChannelCopy(srcFile, backUpFile);

			}
		} catch (Exception e) {
			response.getOutputStream().print(0);
			System.out.println("还原文件失败");
		}}
		response.getOutputStream().print(1);
	}
	}
	@RequestMapping(value = "/loadpic")
	public void loadpic(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException {
		// templateFile 需要备份的函数
		// srcFile是模板文件 也就是原来的log文件 找到它的绝对路径  这是需要备份的现在反过来
		String backpath = request.getParameter("path");//服务器下的文件 srcFile
		String date=request.getParameter("date");
		Properties p = PropertiesUtil.readProperties("file.properties");
		String templateFile = p.getProperty("picRootName");//图片文件夹名
		String paths = Class.forName(this.getClass().getName()).getResource("/").getPath();
		int index = Integer.parseInt(
				"" + Class.forName(this.getClass().getName()).getResource("/").getPath().indexOf("webapps")) + 7;
		paths = paths.substring(1, index);
		//String webpath = paths + "/" + templateFile;//服务器下图片路径
		//判断文件夹下是否有以该日期结尾的日志文件  判断日期是否为系统日期 
		String path=backpath+"/"+templateFile;//D:/logs
		File backUpFilemkdir = new File(paths + "/" + templateFile);
		System.out.println(backUpFilemkdir);
		if(!backUpFilemkdir.exists()){
			backUpFilemkdir.mkdir();
		}
			 String somepath = null;
			 if(date!=null&&!date.equals("")){
				String[] d=date.split("-");
				String year=d[0];
				String mouth=d[1];
				if(mouth.startsWith("0")){
					mouth=mouth.substring(1, mouth.length());
				}
				String day=d[2];
				somepath=backpath+"/"+templateFile+"/"+year+"/"+mouth+"/"+day;
				File srcFiles=new File(somepath);
				System.out.println(backUpFilemkdir);
				if(srcFiles.exists()){
					 filelist=new ArrayList<String>();
						getFiles(somepath);
						for(int i=0;i<filelist.size();i++){
							int indexs=filelist.get(i).indexOf(":");
							int length=filelist.get(i).length();
							String newpaths=filelist.get(i).substring(indexs+1,length);
							String newpath=paths+newpaths;
							try {
								File backUpFile=new File(newpath);
								File srcFile=new File(filelist.get(i));
								 if(backUpFile.exists()){
									 backUpFile.delete();
								 }
								if (backUpFile.createNewFile()) {
									// 创建备份文件成功，进行文件复制
									 fileChannelCopy(srcFile, backUpFile);
								}
							} catch (Exception e) {
								response.getOutputStream().print(0);
								System.out.println("还原文件失败");
							}
						}
						response.getOutputStream().print(1);
				}else{
					response.getOutputStream().print(3);
				}
			 }else{
				 filelist=new ArrayList<String>();
				 filedirlist=new ArrayList<String>();
				getFiles(path);
				 for(int j=0;j<filedirlist.size();j++){
				   		int indexs=filedirlist.get(j).indexOf(":")+1;
						String newpaths=filedirlist.get(j).substring(indexs, filedirlist.get(j).length());
							File backUp=new File(paths+"/"+newpaths);
							System.out.println(backUp);
							  if (!backUp.getParentFile().exists()) {  
					                backUp.getParentFile().mkdirs();  
					            }else{
					            	backUp.mkdir();
					            }
				       }
				 //创建及备份文件
			        for(int i=0;i<filelist.size();i++){
			        	String filelistpath=filelist.get(i);
			       		File filelists=new File(filelistpath);
			       		int indexs=filelist.get(i).indexOf(":");
						int length=filelist.get(i).length();
						String newpaths=filelist.get(i).substring(indexs+1,length);
						String newpath=paths+newpaths;
			       	try{
			       		File backUpfile=new File(newpath);
			       		if(backUpfile.exists()){
			       			backUpfile.delete();
						}
						if (backUpfile.createNewFile()) {
							// 创建备份文件成功，进行文件复制
							 fileChannelCopy(filelists, backUpfile);
						}
			    	} catch (Exception e) {
						response.getOutputStream().print(0);
						System.out.println("还原文件失败");
					}}
			        response.getOutputStream().print(1);
			        }
			 }
			 
//得到文件路径下文件夹及文件
	public static void getFiles(String filePath){
		  File root = new File(filePath);
		    File[] files = root.listFiles();
		    for(File file:files){    
		     if(file.isDirectory()){
		      getFiles(file.getAbsolutePath());
		      filedirlist.add(file.getAbsolutePath());
		     }else{
		      filelist.add(file.getAbsolutePath());
		     }    
		    }
		 }
	//复制文件
	public static void fileCopy(File srcFile, File destFile) throws Exception {
		InputStream src = new BufferedInputStream(new FileInputStream(srcFile));
		OutputStream dest = new BufferedOutputStream(new FileOutputStream(destFile));
		byte[] trans = new byte[1024];
		int count = -1;
		while ((count = src.read(trans)) != -1) {
			dest.write(trans, 0, count);
		}
		dest.flush();
		src.close();
		dest.close();
	}
	
	//复制文件 研究JDK文档时发现，用文件通道（FileChannel）来实现文件复制竟然比用老方法快了近三分之一
	public static void fileChannelCopy(File s, File t) {
        FileInputStream fi = null;
        FileOutputStream fo = null;
        FileChannel in = null;
        FileChannel out = null;
        try {
            fi = new FileInputStream(s);
            fo = new FileOutputStream(t);
            in = fi.getChannel();//得到对应的文件通道
            out = fo.getChannel();//得到对应的文件通道
            in.transferTo(0, in.size(), out);//连接两个通道，并且从in通道读取，然后写入out通道
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fi.close();
                in.close();
                fo.close();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
	}
	
