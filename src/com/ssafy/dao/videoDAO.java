package com.ssafy.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class videoDAO {
	videoDTO[] videos= {new videoDTO("gMaB-fG4u4g","전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]","전신","ThankyouBUBU","https://www.youtube.com/embed/gMaB-fG4u4g",new Date()),
			new videoDTO("swRNeYw1JkY","하루 15분! 전신 칼로리 불태우는 다이어트 운동","전신","ThankyouBUBU","https://www.youtube.com/embed/swRNeYw1JkY",new Date()),
			new videoDTO("54tTYO-vU2E","상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]","상체","ThankyouBUBU","https://www.youtube.com/embed/54tTYO-vU2E",new Date()),
			new videoDTO("QqqZH3j_vH0","상체비만 다이어트 최고의 운동 [상체 핵매운맛]","상체","ThankyouBUBU","https://www.youtube.com/embed/QqqZH3j_vH0",new Date()),
			new videoDTO("tzN6ypk6Sps","하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]","하체","김강민","https://www.youtube.com/embed/tzN6ypk6Sps",new Date()),
			new videoDTO("u5OgcZdNbMo","저는 하체 식주의자 입니다","하체","GYM종국","https://www.youtube.com/embed/u5OgcZdNbMo",new Date()),
			new videoDTO("PjGcOP-TQPE","11자복근 복부 최고의 운동 [복근 핵매운맛]","복부","ThankyouBUBU","https://www.youtube.com/embed/PjGcOP-TQPE",new Date()),
			new videoDTO("7TLk7pscICk","(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)","복부","SomiFit","https://www.youtube.com/embed/7TLk7pscICk",new Date())
			};
	List<videoDTO> videoList = Arrays.asList(videos);
	int idx=0;
	
	//싱글톤
	private videoDAO() {
		
	}
	
	private static videoDAO instance = new videoDAO();
	public static videoDAO getInstance() {
		return instance;
	}
	
	//전체 영상 출력
	public List<videoDTO> selectAll(){
		return videoList;
	}
	
	//부위별 영상 출력
	public List<videoDTO> selectPart(String part){
		List<videoDTO> result = new ArrayList<videoDTO>();
		for(videoDTO v:videoList) {
			if(v.getPart().equals(part)) {
				result.add(v);
			}
		}
		return result;
	}
	
	//검색어 포함된 영상 출력
	public List<videoDTO> searchVideo(String keyword){
		List<videoDTO> result = new ArrayList<videoDTO>();
		for(videoDTO v:videoList) {
			if(v.getChannelName().contains(keyword)) {
				result.add(v);
			}
			if(v.getTitle().contains(keyword)) {
				result.add(v);
			}
			if(v.getPart().contains(keyword)) {
				result.add(v);
			}
		}
		return result;
	}
	
	//상세페이지에 하나의 영상만 보내주기
	public videoDTO selectOne(String id) {
		for(videoDTO v:videoList) {
			if(v.getId().equals(id)) {
				return v;
			}
		}
		return null;
	}
	
	//조회한 영상 조회수 상승
	public void addViewPoint(String id){
		for(videoDTO v:videoList) {
			if(v.getId().equals(id)) {
				v.setViewPoint(v.getViewPoint()+1);
			}
		}
	}
}
