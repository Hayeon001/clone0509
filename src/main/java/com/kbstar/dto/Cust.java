package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {

    @Size(min=4, max=10, message="ID는 최소 4자리 최대 10자리 입니다.")  //지정한 사이즈 이외는 에러발생
    @NotEmpty(message = "ID는 필수 항목입니다.") //Blank 값은 안된다
    private String id;

    @Size(min=4, max=10, message="PWD는 최소 4자리 최대 10자리 입니다.")  //지정한 사이즈 이외는 에러발생
    @NotEmpty(message = "PWD는 필수 항목입니다.")
    private String pwd;

    @NotEmpty(message = "NAME는 필수 항목입니다.")
    private String name;
}
