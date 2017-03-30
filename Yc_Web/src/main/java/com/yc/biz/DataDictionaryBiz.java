package com.yc.biz;

import java.util.List;

import com.yc.bean.DataDictionary;
/**
 * 数据字典接口
 * @author S3
 *
 */
public interface DataDictionaryBiz {

	public List<DataDictionary> findDataDictionary(DataDictionary dataDictionary);
	
	public void updateDataDictionary(DataDictionary dataDictionary);
	
}
