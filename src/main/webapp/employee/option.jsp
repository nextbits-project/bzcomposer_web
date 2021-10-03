<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<%@include file="/include/headlogo.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="/include/menu.jsp"%>
<script>
window.onload = initShowHideDivs;
</script>
<script type="text/javascript">
function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var unicode=e.charCode? e.charCode : e.keyCode;
	if (unicode!=8)
	{
	 	//if the key isn't the backspace key (which we should allow)
		if(unicode==46 && temp==-1)
		{
	 		return true;
		} 
		else 
			if (unicode<48||unicode>57) //if not a number
				return false; //disable key press
	}
}
</script>
<title><bean:message key="BzComposer.optiontitle" /></title>
</head>
<body>
<html:form action="/CompanyTaxOption" method="post">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
	<div class="statusquo ok">
	<div id="hoja">
	<div id="blanquito">
	<div id="padding">
		<!-- begin Contents --> 
		<span id="waitMessage">
			<img src="<bean:write name="path" property="pathvalue"/>/images/spinner.gif">
			<bean:message key="BzComposer.option.loadingcontents"/>
		</span>
		<div class="dhtmlgoodies_question">
			<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; 
			border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
				<bean:message key="BzComposer.option.optioninformation" />
			</span>
		</div>
		<div class="dhtmlgoodies_answer">
			<div id="table-negotiations"><logic:present name="CompTaxOptionlist" scope="request">
				<logic:notEmpty name="CompTaxOptionlist" scope="request">
					<logic:iterate name="CompTaxOptionlist" id="objList" scope="request">
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th class="emblem" colspan="5">
										<bean:message key="BzComposer.option.payperiod" />:
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="right">
										<html:checkbox name="objList" property="daily" />&nbsp;
										<bean:message key="BzComposer.option.dailyormiscellaneous" />
									</td>
									<td>
										<html:checkbox name="objList" property="weekly" />&nbsp; 
										<bean:message key="BzComposer.option.weekly" />
									</td>
									<td align="left">
										<html:checkbox name="objList" property="biweekly" />&nbsp; 
										<bean:message key="BzComposer.option.biweekly" />
									</td>
								</tr>
								<tr>
									<td align="right">
										<html:checkbox name="objList" property="semiMonthly" />&nbsp; 
										<bean:message key="BzComposer.option.semimonthly" />
									</td>
									<td>
										<html:checkbox name="objList" property="monthly" />&nbsp; 
										<bean:message key="BzComposer.option.dailyormiscellaneous" />
									</td>
									<td align="left">
										<html:checkbox name="objList" property="quarterly" />&nbsp; 
										<bean:message key="BzComposer.option.quarterly" />
									</td>
								</tr>
								<tr>
									<td align="right">
										<html:checkbox name="objList" property="semiAnnualy" />&nbsp; 
										<bean:message key="BzComposer.option.semiannualy" />
									</td>
									<td>
										<html:checkbox name="objList" property="annualy" />&nbsp; 
										<bean:message key="BzComposer.option.annualy" />
									</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
						<table cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td>
										<table class="tabla-listados" cellspacing="0">
											<thead>
												<tr>
													<th class="emblem" colspan="5">
														<bean:message key="BzComposer.option.setovertime" />
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td align="right">
														<html:radio name="objList" value="1" property="dailyOverVal" 
														onclick="changeWeekly();" /> 
														<bean:message key="BzComposer.option.dailyover" />
													</td>
													<logic:equal name="objList" property="dailyOverVal" value="true">
														<script>
															document.CompanyTaxOptionForm.dailyOverVal.checked=true;
															document.CompanyTaxOptionForm.weeklyOverVal.checked=false;
														</script>
													</logic:equal>
													<td>
														<html:text name="objList" property="dailyOver" 
														onkeypress="return numbersonly(event,this.value)" /> 
														(<bean:message key="BzComposer.option.hours" />)
													</td>
												</tr>
												<tr>
													<td align="right">
														<html:radio name="objList" value="1" property="weeklyOverVal" 
														onclick="changeDaily();" />
														<bean:message key="BzComposer.option.weeklyover" />
													</td>
													<logic:equal name="objList" property="weeklyOverVal" value="true">
														<script>
															document.CompanyTaxOptionForm.dailyOverVal.checked=false;
															document.CompanyTaxOptionForm.weeklyOverVal.checked=true;
														</script>
													</logic:equal>
													<td>
														<html:text name="objList" property="weeklyOver"
														onkeypress="return numbersonly(event,this.value)" /> 
														( <bean:message key="BzComposer.option.hours" /> )
													</td>
												</tr>
												<tr>
													<td align="right">
														<bean:message key="BzComposer.option.rate" />:
													</td>
													<td>
														<html:text name="objList" property="rate"
														onkeypress="return numbersonly(event,this.value)" />
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td>
										<table class="tabla-listados" cellspacing="0">
											<thead>
												<tr>
													<th class="emblem" colspan="5">
														<bean:message key="BzComposer.option.setholidaytime" />
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td align="right">
														<html:checkbox name="objList" property="wendSt" />&nbsp; 
														<bean:message key="BzComposer.option.weekendsaturday" />
													</td>
													<td>
														<bean:message key="BzComposer.option.rate" /> : 
														<html:text name="objList" property="wendStRate"
														onkeypress="return numbersonly(event,this.value)" />
													</td>
												</tr>
												<tr>
													<td align="right">
														<html:checkbox name="objList" property="wendSn" />&nbsp;
														<bean:message key="BzComposer.option.weekendsunday" />
													</td>
													<td>
														<bean:message key="BzComposer.option.rate" /> : 
														<html:text name="objList" property="wendSnRate"
														onkeypress="return numbersonly(event,this.value)" />
													</td>
												</tr>
												<tr>
													<td align="right">
														<html:checkbox name="objList" property="holyday" />&nbsp; 
														<bean:message key="BzComposer.option.holiday" />
													</td>
													<td>
														<bean:message key="BzComposer.option.rate" /> :
														<html:text name="objList" property="holydayRate"
														onkeypress="return numbersonly(event,this.value)" />
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="tabla-listados" cellspacing="0">
							<thead>
								<tr>
									<th class="emblem" colspan="5">
										<bean:message key="BzComposer.option.setpayrollday" />
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="right">
										<html:checkbox name="objList" property="dayOfWeekVal" />&nbsp; 
										<html:text name="objList" property="dayOfWeek"
										onkeypress="return numbersonly(event,this.value)" />&nbsp; 
										<bean:message key="BzComposer.option.dayofweek" />
									</td>
									<td align="left">
										<html:checkbox name="objList" property="dayOfMonthVal" />&nbsp; 
										<html:text name="objList" property="dayOfMonth"
										onkeypress="return numbersonly(event,this.value)" />&nbsp; 
										<bean:message key="BzComposer.option.dayofmonth" />
									</td>
								</tr>
							</tbody>
						</table>	
						<table class="tabla-listados" cellspacing="0">
							<tbody>
								<tr>
									<td colspan="4" align="center">
										<input type="button" value="<bean:message key="BzComposer.option.saveoptions"/>"
										class="formbutton" onclick="editOption();">
									</td>
								</tr>
							</tbody>
						</table>
					</logic:iterate>
		</logic:notEmpty>
	</logic:present></div>
	</div>
	<!-- end Contents --></div>
	</div>
	</div>
	</div>
	<%@ include file="/include/footer.jsp"%></div>
</html:form>
</body>
</html>
<script>
function editOption()
{
	document.forms[0].action = "CompanyTaxOption.do?tabid=t2x2o2";
	document.forms[0].submit();
}
function changeDaily()
{
	document.CompanyTaxOptionForm.dailyOverVal.checked=false;
	document.CompanyTaxOptionForm.weeklyOverVal.checked=true;
}
function changeWeekly()
{
	document.CompanyTaxOptionForm.dailyOverVal.checked=true;
	document.CompanyTaxOptionForm.weeklyOverVal.checked=false;
}
</script>