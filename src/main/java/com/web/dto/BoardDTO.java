package com.web.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	private int biNum; // BI_NUM
	private String biTitle; // BI_TITLE
	private String biContent; // BI_CONTENT
	private int uiNum; // UI_NUM
	private String credat; // CREDAT
	private String cretim; // CRETIM
	private String uiName;
	private String biPath;
}
