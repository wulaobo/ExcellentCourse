package com.mybatis.test;
/**
 * 批处理类main方法,利用MyBatis Generator自动创建代码
 * 根据表自动创建实体类、MyBatis映射文件以及DAO接口
 */
import org.mybatis.generator.api.ShellRunner;

public class App {

	public static void main(String[] args) {
		args = new String[] { "-configfile", "src\\main\\resources\\mybatis-generator-config.xml", "-overwrite" };
        ShellRunner.main(args);
	}

}