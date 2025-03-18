<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var human = {
		name : '홍길동',
		age : 22,
		address : '서울 강서구'
}
human.toString = function(){
	let str = '';
	for(let key in this){
		if(typeof this[key] !='function'){
			str += key + ' = ' + this[key] + ',';
		}
	}
	return str;
}
document.write(human + '<br>');
human.etc = '비고';
human['test'] = 'test';

document.write(human + '<br>');

</script>
</body>
</html>