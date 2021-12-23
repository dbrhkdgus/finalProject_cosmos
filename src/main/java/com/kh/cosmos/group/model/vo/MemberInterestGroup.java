package com.kh.cosmos.group.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberInterestGroup implements Serializable {/**
    * 
    */
   private static final long serialVersionUID = 1L;
   
   private int InterNo;
   private String MemberId;
   private int GroupNo;
   
   

}
