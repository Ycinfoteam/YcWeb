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
	
	public void updateFooter(DataDictionary dataDictionary);
	
	public void updateDescription(DataDictionary dataDictionary);
	
	public void updateLogo(DataDictionary dataDictionary);
}
