package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail {
   
   private int order_idx;
   
   private int ingre_idx;
   
   private String ingre_img;
   
   private String ingre_name;
   
   private int order_cnt;
}