<%--
  Created by IntelliJ IDEA.
  User: amyyy
  Date: 5/17/2021
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="page_nav">
  <c:if test="${requestScope.page.pageNo > 1}">
    <button><a href="${requestScope.page.url}&pageNo=1" style="text-decoration:none;">FirstPage</a></button>
    <button><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}" style="text-decoration:none;">◁ Prev</a></button>
    <%--				<a href="#">${requestScope.page.pageNo-1}</a>--%>
  </c:if>
  <%--			Begin--%>
  <c:choose>
    <c:when test="${requestScope.page.pageTotal <= 5}">
      <c:set var="begin" value="1" />
      <c:set var="end" value="${requestScope.page.pageTotal}" />
    </c:when>
    <c:when test="${requestScope.page.pageTotal > 5}">
      <c:choose>
        <c:when test="${requestScope.page.pageNo <= 3}">
          <c:set var="begin" value="1" />
          <c:set var="end" value="5" />
        </c:when>
        <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotal - 3}">
          <c:set var="begin" value="${requestScope.page.pageTotal - 4}" />
          <c:set var="end" value="${requestScope.page.pageTotal}" />
        </c:when>
        <c:otherwise>
          <c:set var="begin" value="${requestScope.page.pageNo - 2}" />
          <c:set var="end" value="${requestScope.page.pageNo + 2}" />
        </c:otherwise>
      </c:choose>
    </c:when>
  </c:choose>

  <c:forEach begin="${begin}" end="${end}" var="i">
    <c:if test="${i == requestScope.page.pageNo}">
      【${i}】
    </c:if>
    <c:if test="${i != requestScope.page.pageNo}">
      <a href="${requestScope.page.url}&pageNo=${i}">${i}</a>
    </c:if>
  </c:forEach>

  <%--			End--%>
  <%--			【${requestScope.page.pageNo}】--%>

  <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
    <%--				<a href="#">${requestScope.page.pageNo+1}</a>--%>
    <button><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}" style="text-decoration:none;">Next ▷</a></button>
    <button><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageTotal}" style="text-decoration:none;">LastPage</a></button>
  </c:if>

  { 🗊 Total ${requestScope.page.pageTotal} Pages} { 📚 Total ${requestScope.page.pageTotalCount} Items} ♩ ♪ ♫ ♬ Page <input value="${param.pageNo}" name="pn" id="pn_input"/>
  <input id="searchPageBtn" type="button" value="Go">🚀

  <script type="text/javascript">
    $(function () {
      $("#searchPageBtn").click(function () {
        var pageNo = $("#pn_input").val();
        var pageTotal = ${requestScope.page.pageTotal};
        if(pageNo < 1 || pageNo > pageTotal ){
          alert("Invalid Page Number!");
          return false;
        }
        else{
          location.href = "${pageScope.basePath}${requestScope.page.url}&pageNo=" + pageNo;
        }
      })
    })
  </script>
</div>
