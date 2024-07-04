package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Lombok을 사용하여 Getter, Setter, toString 등 자동 생성
@AllArgsConstructor // 모든 필드를 사용하는 생성자 생성
@NoArgsConstructor // 파라미터가 없는 기본 생성자 생성
public class SearchCriteria {
    private String keyword; // 검색 키워드를 저장하는 필드

}
