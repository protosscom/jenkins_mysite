<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<HEAD>

<TITLE>footer 하단 고정</TITLE>

</HEAD>

<style style="text/css">

html,

body {

    margin:0;

    padding:0;

    height:100%;

}

#wrapper {

	position:relative;

    min-height:100%;
    
    height:1000px;

}

#header {

	height:70px;

    background:#ccc;

}

#container {

    padding:20px;

}

#footer {

    position:absolute;

    bottom:0;

    width:100%;

    height:70px;   

    background:#ccc;

}

</style>

<BODY>

<div id="wrapper">

    <div id="header">header</div>

    <div id="container">나는 container입니다.

	</div>

    <div id="footer">footer</div>

</div>

</BODY>

</HTML>