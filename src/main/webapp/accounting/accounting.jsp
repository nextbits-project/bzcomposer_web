<%@ page isELIgnored="false"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Currency"%>
<%@page import="jdk.nashorn.internal.runtime.linker.JavaAdapterFactory"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPayment"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblAccount"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.TblPaymentType"%>
<%@page import="com.nxsol.bizcomposer.global.clientvendor.ClientVendor"%>
<%@page import="com.nxsol.bizcomposer.common.JProjectUtil"%>
<%@page import="java.util.Date"%>
<%@page import="com.nxsol.bizcompser.global.table.TblCategory"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.pritesh.bizcomposer.accounting.bean.ReceivableListBean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<table class="table table-bordered table-sm devAcRecDataTbl">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col">P.O.#</th>
				      <th scope="col" class="text-right">Vendor</th>
				      <th scope="col" class="text-right">Paid Date</th>
				      <th scope="col" class="text-right">PaymentType</th>
				      <th scope="col" class="text-right">Check#</th>
				      <th scope="col" class="text-right">Pay From</th>
				      <th scope="col" class="text-right">Amount</th>
				      <th scope="col" class="text-right">Paid Amount</th>
				      <th scope="col" class="text-right">Balance</th>
				      <th scope="col" class="text-right">Category</th>
				      <th scope="col" class="text-right">Memo</th>
				    </tr>
				  </thead>
				  <tbody id="tblForPaidPOBody"> 
				  <%
				  	ArrayList<TblPayment> li = (ArrayList)request.getAttribute("paidList");		
				  	Iterator<TblPayment> itr =li.iterator();
							  int index=1;
				  	while(itr.hasNext())
				  	{
				  		TblPayment rb = itr.next();
				    %>
				  <tr onclick="selectrow(<%=rb.getInvoiceID()+","+index+","+rb.getId()%>)">
			
				      <td class="text-right"><% out.println(rb.getPoNum()); %></td>
				      <td class="text-right" value="<%= rb.getCvID()%>"><% out.println(rb.getCvName()) ;%></td>
				      <td class="text-right"><% out.println(JProjectUtil.dateFormat.format(rb.getDateAdded()));%></td>
				      <td class="text-right" value="<%= rb.getPaymentTypeID()%>"><% out.println(rb.getPaymentTypeName()); %></td>
				       <td class="text-right"><% out.println(rb.getCheckNumber()); %></td>
				      <td class="text-right" value="<%= rb.getAccountID() %>"><% out.println(rb.getAccountNameString()); %></td>
				      <td class="text-right"><% out.println(rb.getTotalAmount());%></td>
				      <td class="text-right"><% out.println(rb.getAmount()); %></td>
				      <td class="text-right"><% out.println(new DecimalFormat("0.00").format(rb.getBalance())); %></td>
				      <td class="text-right" value="<%=rb.getCategoryId() %>"><% out.println(rb.getCategoryName()); %></td>
				      <td class="text-right"></td>
				       <td hidden="PaidOrUnpaid" value="<%= request.getSession().getAttribute("PaidOrUnpaid"+rb.getInvoiceID()) %>"></td>
				 
				    </tr>
			<%
			index++;
				} %>
		</tbody>	
	</table>