<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="kr.co.nicevan.nicepay.adapter.web.NicePayHttpServletRequestWrapper"%>
<%@ page import="kr.co.nicevan.nicepay.adapter.web.NicePayWEB"%>
<%@ page import="kr.co.nicevan.nicepay.adapter.web.dto.WebMessageDTO"%>
<%
/*
*******************************************************
* <��� ��� ����>
* ����� ��� �ɼ��� ����� ȯ�濡 �µ��� �����ϼ���.
* �α� ���丮�� �� �����ϼ���.
*******************************************************
*/
NicePayHttpServletRequestWrapper httpRequestWrapper = new NicePayHttpServletRequestWrapper(request);
NicePayWEB nicepayWEB = new NicePayWEB();

nicepayWEB.setParam("NICEPAY_LOG_HOME","C:/log");                           // �α� ���丮 ����
nicepayWEB.setParam("APP_LOG","1");                                         // �̺�Ʈ�α� ��� ����(0: DISABLE, 1: ENABLE)
nicepayWEB.setParam("EVENT_LOG","1");                                       // ���ø����̼Ƿα� ��� ����(0: DISABLE, 1: ENABLE)
nicepayWEB.setParam("EncFlag","S");                                         // ��ȣȭ�÷��� ����(N: ��, S:��ȣȭ)
nicepayWEB.setParam("SERVICE_MODE","CL0");                                  // ���񽺸�� ����(���� ���� : PY0 , ��� ���� : CL0)

/*
*******************************************************
* <��� ��� �ʵ�>
*******************************************************
*/
WebMessageDTO responseDTO   = nicepayWEB.doService(httpRequestWrapper,response);

String resultCode           = responseDTO.getParameter("ResultCode");       // ����ڵ� (��Ҽ���: 2001, ��Ҽ���(LGU ������ü):2211)
String resultMsg            = responseDTO.getParameter("ResultMsg");        // ����޽���
String cancelAmt            = responseDTO.getParameter("CancelAmt");        // ��ұݾ�
String cancelDate           = responseDTO.getParameter("CancelDate");       // �����
String cancelTime           = responseDTO.getParameter("CancelTime");       // ��ҽð�
String cancelNum            = responseDTO.getParameter("CancelNum");        // ��ҹ�ȣ
String payMethod            = responseDTO.getParameter("PayMethod");        // ��� ��������
String mid                  = responseDTO.getParameter("MID");              // ���� ID
String tid                  = responseDTO.getParameter("TID");              // �ŷ����̵� TID
%>
<!DOCTYPE html>
<html>
<head>
<title>NICEPAY CANCEL RESULT(EUC-KR)</title>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
<link rel="stylesheet" type="text/css" href="./css/import.css"/>
</head>
<body>
  <div class="payfin_area">
    <div class="top">NICEPAY CANCEL RESULT(EUC-KR)</div>
    <div class="conwrap">
      <div class="con">
        <div class="tabletypea">
          <table>
            <tr>
              <th><span>�ŷ� ���̵�</span></th>
              <td><%=tid%></td>
            </tr>
            <tr>
              <th><span>���� ����</span></th>
              <td><%=payMethod%></td>
            </tr>         
            <tr>
              <th><span>��� ����</span></th>
              <td>[<%=resultCode%>]<%=resultMsg%></td>
            </tr>
            <tr>
              <th><span>��� �ݾ�</span></th>
              <td><%=cancelAmt%></td>
            </tr>
            <tr>
              <th><span>�����</span></th>
              <td><%=cancelDate%></td>
            </tr>
            <tr>
              <th><span>��ҽð�</span></th>
              <td><%=cancelTime%></td>
            </tr>
          </table>
        </div>
      </div>
      <p>* ��Ұ� ������ ��쿡�� �ٽ� ���λ��·� ���� �� �� �����ϴ�.</p>
    </div>
  </div>
</body>
</html>