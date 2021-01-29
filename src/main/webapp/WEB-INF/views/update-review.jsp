<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="text" value="${board.content}" name="edit-content">
<input type="hidden" value="${board.boardId}" name="r_idx">
<input type="button" id="btn-edit-comp">