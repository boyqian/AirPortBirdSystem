package com.boyqian.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyqian.dao.SearchDao;
import com.boyqian.param.AreaReq;
import com.boyqian.param.BubbleGraphReq;
import com.boyqian.param.NameNumReq;
import com.boyqian.param.NameReq;
import com.boyqian.param.NameTimeNumReq;

@Service
public class SearchService {
	@Autowired
	SearchDao searchDao;
	public List<NameNumReq> findBirdNameAndNum(){
		return searchDao.findBirdNameAndNum();
	}
	public List<Object> findArea(){
		List<Object> list=new ArrayList<Object>();
		List<AreaReq> listA=searchDao.findAllArea();
		int[] A=new int[12];
		int[] B=new int[12];
		int[] C=new int[12];
		int[] D=new int[12];
		int[] F=new int[12];
		int[] N=new int[12];
		for(int j=0;j<listA.size();j++){
			switch(listA.get(j).getArea()){
			case "A":
				A=findAreaNum(listA.get(j).getArea()); 
				break;
			case "B":
				B=findAreaNum(listA.get(j).getArea());
				break;
			case "C":
				C=findAreaNum(listA.get(j).getArea());
				break;
			case "D":
				D=findAreaNum(listA.get(j).getArea());
				break;
			case "F":
				F=findAreaNum(listA.get(j).getArea());
				break;
			case "N":
				N=findAreaNum(listA.get(j).getArea());
				break;
			}
		}
		list.add(A);
		list.add(B);
		list.add(C);
		list.add(D);
		list.add(F);
		list.add(N);
		return list;
	}

	private int[] findAreaNum(String area) {
		List<NameTimeNumReq> list=searchDao.findBirdNTN(area);
		int[] S=new int[12];
		for(int i=0;i<list.size();i++){
			if(list.get(i).getMonth()==1){
				S[0]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==2){
				S[1]=list.get(i).getNum();		
			}
			if(list.get(i).getMonth()==3){
				S[2]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==4){
				S[3]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==5){
				S[4]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==6){
				S[5]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==7){
				S[6]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==8){
				S[7]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==9){
				S[8]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==10){
				S[9]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==11){
				S[10]=list.get(i).getNum();
			}
			if(list.get(i).getMonth()==12){
				S[11]=list.get(i).getNum();
			}
			
		}
		return S;
	}
	
	public Object[] findBubble(){
		List<BubbleGraphReq> listBubble=new ArrayList<BubbleGraphReq>();
		List<NameReq> listName=searchDao.findAllName();
		Object[] obj=new Object[listName.size()];
		for(int m=0;m<listName.size();m++){
				int count=searchDao.findBubbleCount(listName.get(m).getName());
				Object[] objv=new Object[count];
				listBubble=searchDao.findBubble(listName.get(m).getName());
				for(int p=0;p<count;p++){
					objv[p]=listBubble.toArray();
				}
				obj[m]=objv;
		}
		return obj;
	}
	
}
